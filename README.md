# etff wiki

Vimwiki + Jekyll + GitHub Pages 기반 개인 위키. <https://etff.github.io>

[johngrib/johngrib-jekyll-skeleton](https://github.com/johngrib/johngrib-jekyll-skeleton)을
기반으로 만들었습니다. 구조에 대한 원작자의 설명은
<https://johngrib.github.io/wiki/my-wiki/> 에서 볼 수 있습니다.

## 설치하기

### 루비

macOS 시스템 기본 루비(2.6.x)로는 설치되지 않습니다. 의존성 중 `ffi`가 루비
`>= 3.0`을 요구하기 때문입니다. Homebrew 루비를 사용하세요.

```bash
$ brew install ruby
$ export PATH="/opt/homebrew/opt/ruby/bin:$PATH"   # 셸 설정에 추가해 두는 것을 권장
$ ruby -v                                          # 3.x 인지 확인
```

그다음 `bundle install`로 의존성을 설치합니다.

```bash
$ bundle install
```

> 루비 3.4부터 `csv`, `base64`, `bigdecimal`, `logger`가 기본 gem에서 빠졌고
> Jekyll 4.1이 이들을 필요로 하므로 `Gemfile`에 명시해 두었습니다.

### 노드 모듈

메타 데이터 생성을 위해 `generateData.js`를 실행해야 하며, 이를 위해 `yamljs`
의존성이 필요합니다.

```bash
$ npm install
```

### Git hooks 추가하기

새로운 글을 등록하면 메타 데이터를 업데이트해 주어야 합니다. 커밋 전에 자동으로
실행되도록 Git Hooks를 추가합니다.

```bash
$ cp tool/pre-commit ./.git/hooks
```

## 실행하기

```bash
$ ./generateData.js                # 메타 데이터 생성 (data/, 태그 목록)
$ bundle exec jekyll serve         # http://127.0.0.1:4000
```

`start.sh`에 자주 쓰는 조합이 들어 있습니다.

```bash
$ ./start.sh watch    # generateData 후 --watch 로 실행
$ ./start.sh back     # 백그라운드 실행 (로그: .localhost.log, PID: .localhost.pid)
$ ./start.sh kill     # 백그라운드 서버 종료
$ ./start.sh docker   # docker-compose 로 실행
```

## 글 작성하기

### 새로운 카테고리 만들기

카테고리가 있는 글을 작성하려면 카테고리를 먼저 만들어야 합니다.
`/_wiki/category-name.md` 파일을 만들고 다음 내용을 넣습니다.
이때 `layout`은 `category`여야 합니다.

```markdown
---
layout  : category
title   : 제목을 입력합니다.
summary :
date    : 2026-08-10 00:00:00 +0900
updated : 2026-08-10 00:00:00 +0900
tag     :
toc     : true
public  : true
parent  : index
latex   : false
---

* TOC
{:toc}
```

### 위키에 글 등록하기

`/_wiki` 폴더 아래에 마크다운으로 파일을 작성합니다. 카테고리 아래에 두려면
카테고리 이름으로 폴더를 만들고 그 안에 파일을 추가합니다. 예를 들어
`/_wiki/category-name/document.md` 처럼 만듭니다.

`layout`은 `wiki`, `parent`는 상위 카테고리 이름입니다. 상위 카테고리가 없으면
`parent`에 `index`를 넣습니다.

```markdown
---
layout  : wiki
title   : 제목을 적습니다
summary :
date    : 2026-08-10 11:23:00 +0900
updated : 2026-08-10 11:23:00 +0900
tag     :
toc     : true
public  : true
parent  : category-name
latex   : false
---

* TOC
{:toc}

내용을 적습니다.
```

### front matter 참고

| 필드 | 설명 |
|---|---|
| `layout` | 카테고리는 `category`, 일반 문서는 `wiki` |
| `title` | 문서 제목. 브라우저 탭과 목록에 노출 |
| `summary` | 목록과 `<meta name="description">`에 사용 |
| `date` / `updated` | 작성일 / 수정일 |
| `tag` | 공백으로 구분. `/tag/` 페이지와 `data/tag/*.json`이 이 값으로 생성됨 |
| `toc` | `true`면 `* TOC` / `{:toc}` 위치에 목차 생성 |
| `public` | `false`면 배포에서 제외 (초안 작성용) |
| `parent` | 상위 문서. `[[index]]`처럼 대괄호를 써도 되고 `index`로 써도 됨 |
| `latex` | `true`면 MathJax 로드 |
| `resource` | 첨부 이미지를 두는 `resource/` 하위 경로 |

문서끼리는 `[[document-name]]` 형식으로 연결합니다. 여기서 `document-name`은
`_wiki` 기준 확장자 없는 경로입니다 (예: `_wiki/java/generics.md` → `java/generics`).

## 배포

`master`에 push하면 GitHub Pages가 자동으로 빌드합니다 (legacy 빌드).
커밋 전 pre-commit 훅이 `generateData.js`를 실행해 `data/`를 갱신합니다.

## 댓글

[giscus](https://giscus.app)를 사용합니다. `_config.yml`의 `giscus.repo_id`와
`giscus.category_id`를 채워야 동작합니다. 사전에 리포의 Discussions를 활성화하고
giscus 앱을 설치해야 합니다.
