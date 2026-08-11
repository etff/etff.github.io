# etff wiki

Jekyll + GitHub Pages 기반 개인 위키. <https://etff.github.io>

테마는 [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)를 gem 으로 가져다 씁니다.
테마 파일을 저장소에 복사해 두지 않으므로, 업그레이드는 `Gemfile` 의 버전만 올리면 됩니다.

## 설치하기

macOS 시스템 기본 루비(2.6.x)로는 설치되지 않습니다. Chirpy 가 Jekyll 4.3+ 를 요구하기
때문입니다. Homebrew 루비를 쓰세요. keg-only 라 PATH 에 직접 넣어야 잡힙니다.

```bash
$ brew install ruby
$ export PATH="/opt/homebrew/opt/ruby/bin:$PATH"   # 셸 설정에 추가해 두는 것을 권장
$ ruby -v                                          # 3.x 인지 확인
$ bundle install
```

### Git hooks 추가하기

커밋할 문서에서 GitHub 에 올라간 이미지를 찾아 `resource/` 아래로 내려받고 경로를
고쳐 주는 훅입니다.

```bash
$ cp tool/pre-commit ./.git/hooks
```

## 실행하기

```bash
$ bundle exec jekyll serve         # http://127.0.0.1:4000
```

`start.sh` 에 자주 쓰는 조합이 들어 있습니다.

```bash
$ ./start.sh watch    # --watch 로 실행
$ ./start.sh back     # 백그라운드 실행 (로그: .localhost.log, PID: .localhost.pid)
$ ./start.sh kill     # 백그라운드 서버 종료
$ ./start.sh docker   # docker-compose 로 실행
```

## 글 작성하기

문서는 모두 `_posts/` 아래에 둡니다. 파일명은 `YYYY-MM-DD-제목.md` 형식이어야 합니다.
카테고리는 폴더가 아니라 front matter 의 `categories` 로 정합니다.

```markdown
---
title: 제목을 적습니다
date: 2026-08-11 11:23:00 +0900
last_modified_at: 2026-08-11 11:23:00 +0900
categories: [book]
tags: [book]
description: 목록과 검색 결과에 쓰입니다
toc: true
---

내용을 적습니다.
```

`* TOC` / `{:toc}` 는 넣지 않습니다. `toc: true` 면 테마가 우측 사이드바에 목차를
만들어 줍니다.

초안은 `_drafts/` 에 두면 빌드에서 빠집니다. 파일명에 날짜 접두사가 없어도 됩니다.

### front matter 참고

| 필드 | 설명 |
|---|---|
| `title` | 문서 제목. `:` 나 `#` 가 들어가면 따옴표로 감싸야 함 |
| `date` | 작성일. 파일명의 날짜와 맞추는 것을 권장 |
| `last_modified_at` | 수정일. 홈의 "최근 업데이트" 목록 기준 |
| `categories` | 최대 2단계. `/categories/<이름>/` 페이지가 자동 생성됨 |
| `tags` | 여러 개 가능. `/tags/<이름>/` 페이지가 자동 생성됨 |
| `description` | 목록과 `<meta name="description">` 에 사용. 없으면 본문 앞부분을 자동 발췌 |
| `toc` | `true` 면 우측에 목차 표시 |
| `math` | `true` 면 MathJax 로드 |
| `comments` | `false` 면 giscus 댓글창을 숨김 |
| `permalink` | URL 을 직접 지정. 없으면 `/posts/<title>/` |
| `resource` | 첨부 이미지를 두는 `resource/` 하위 경로. `tool/save-images.sh` 가 참조 |

### URL 규칙

Vimwiki 시절 문서는 `/wiki/<카테고리>/<이름>/` URL 로 공개돼 있었습니다. 이 URL 을
유지하려고 기존 문서 205개에는 front matter 에 `permalink` 를 박아 두었습니다.
**기존 문서의 `permalink` 는 지우지 마세요.** 지우면 URL 이 `/posts/...` 로 바뀝니다.

새 문서는 `permalink` 없이 써도 됩니다.

구 위키 인덱스 URL(`/wiki/book/`, `/wiki/root-index/`, `/blog/` 등)은 `redirects/`
아래의 리다이렉트 페이지가 `/categories/...` 로 넘겨 줍니다.

## 배포

`master` 에 push 하면 `.github/workflows/pages-deploy.yml` 이 빌드해서 배포합니다.

GitHub Pages 기본 빌드는 쓸 수 없습니다. Chirpy 가 의존하는 `jekyll-archives` 가
GitHub Pages 화이트리스트에 없기 때문입니다. 저장소 **Settings → Pages → Build and
deployment → Source** 를 `GitHub Actions` 로 두어야 합니다.

워크플로는 빌드 후 htmlproofer 로 내부 링크를 검사합니다. 링크가 깨지면 배포가
막힙니다. 본문의 `http://` 외부 링크는 `--no-enforce-https` 로 통과시킵니다.

## 댓글

[giscus](https://giscus.app)를 사용합니다. 설정은 `_config.yml` 의
`comments.provider` 와 `comments.giscus.*` 입니다. 사전에 리포의 Discussions 를
활성화하고 giscus 앱을 설치해야 합니다.
