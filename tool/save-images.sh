#!/usr/bin/env bash

# github에 올린 user-images를 자동으로 다운로드합니다.

# github user id (https://api.github.com/users/etff 의 id)
NUM=8775409

SUCCESS_COUNT=0
FAIL_COUNT=0

# -z 로 널 구분 출력을 받는다.
# 그냥 --name-only 를 쓰면 core.quotepath 때문에 한글 파일명이 따옴표로 감싸인
# 이스케이프 문자열로 나와서 파일을 열 수 없다. 공백이 든 파일명도 깨진다.
while IFS= read -r -d '' CHANGED_FILE; do
    echo "이미지경로를 교정할 문서 파일: [$CHANGED_FILE]"

    RESOURCE_DIR=$(head "$CHANGED_FILE" | egrep -o '[A-F0-9-]{2}/[A-F0-9-]{34}$')

    # resource 항목이 없는 문서는 내려받을 위치가 없으므로 건너뛴다.
    if [ -z "$RESOURCE_DIR" ]; then
        continue
    fi

    TARGET_PATH="./resource/$RESOURCE_DIR"
    echo "생성할 디렉토리 경로: [$TARGET_PATH]"
    mkdir -p "$TARGET_PATH"

    # 작업 대상 파일에서 참조하고 있는 github에 등록된 리소스 파일들의 URI 목록
    # 원본은 ag(the_silver_searcher)를 사용했으나, 별도 설치 없이 동작하도록 perl로 대체했다.
    URI_LIST=$(perl -nle 'print $& while m{https://((user-images\.githubuser.*?/'"$NUM"'/)|(pbs\.twimg\.com/media/)|(video\.twimg\.com/.+_video/)).*?(png|jpg|gif|mp4)}g' "$CHANGED_FILE")

    for URI in $URI_LIST; do
        FILE_NAME=$(echo "$URI" | sed 's,^.*/,,')
        RESOLVE_FILE_PATH="$TARGET_PATH/$FILE_NAME"
        RESOLVE_URL=$(echo "$RESOLVE_FILE_PATH" | sed -E 's/^\.//')

        echo "작업 대상 URI: [$URI]"
        echo "작업 대상 파일 패스: [$RESOLVE_FILE_PATH]"

        if curl -sf "$URI" > "$RESOLVE_FILE_PATH"; then
            echo "DOWNLOAD SUCCESS: $FILE_NAME"
            sed -i '' -E 's, *https://.*('"$FILE_NAME"') *, '"$RESOLVE_URL"' ,g' "$CHANGED_FILE"

            git add "$RESOLVE_FILE_PATH"

            SUCCESS_COUNT=$((SUCCESS_COUNT+1))
        else
            echo "DOWNLOAD FAIL: $FILE_NAME"
            rm -f "$RESOLVE_FILE_PATH"
            FAIL_COUNT=$((FAIL_COUNT+1))
        fi
    done
    git add "$CHANGED_FILE"
done < <(git diff --cached -z --name-only --diff-filter=ACM -- '*.md')

printf "Success: %d, Fail: %d\n" $SUCCESS_COUNT $FAIL_COUNT
