---
layout  : wiki
title   : 책 제목
summary : 한 줄 소개
date    : 0000-00-00 00:00:00 +0900
updated : 0000-00-00 00:00:00 +0900
tag     : book
resource: 00/00000000-0000-0000-0000-000000000000
toc     : true
public  : false
parent  : book
latex   : false
published: false
---
* TOC
{:toc}

<!--
새 책 문서를 만드는 방법

1. 이 파일을 _wiki/book/<문서이름>.md 로 복사한다.
2. 이 주석과 front matter의 published: false 줄을 지운다.
     published 는 Jekyley 내장 키로, 이 템플릿 자체가 사이트에 공개되지 않게 막는 용도다.
     초안으로 두고 싶을 때는 public: false 를 유지하면 된다 (목록에 나오지 않는다).
3. resource 값을 새로 만든다.
     U=$(uuidgen); echo "$(echo $U | cut -c -2)/$(echo $U | cut -c 3-)"
4. date, updated 를 채운다.
     date "+%Y-%m-%d %H:%M:%S %z"
5. 다 쓴 뒤 public: true 로 바꾸고 ./generateData.js 를 실행한다.
-->

## 서지정보

| | |
|---|---|
| 원제 | |
| 저자 | |
| 역자 | |
| 출판 | |
| 읽은 기간 | |

## 한 줄 평

## 핵심 정리

### 1.

### 2.

## 인상 깊은 구절

> 인용

## 내 생각

## 적용할 점

## Links
