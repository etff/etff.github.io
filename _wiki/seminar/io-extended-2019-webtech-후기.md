---
layout  : wiki
title   : I/O Extended 2019 WebTech 후기
summary : 
date    : 2019-07-14 14:33:23 +0900
updated : 2019-07-14 14:33:23 +0900
tag     : seminar
resource: 5B/634787-F52D-4F0F-8E77-84E85A3D6594
toc     : true
public  : true
parent  : seminar
latex   : false
origin  : https://itcoin.tistory.com/16
---
* TOC
{:toc}

![kakaotalk-photo-2019-07-14-14-32-31](/resource/5B/634787-F52D-4F0F-8E77-84E85A3D6594/01-kakaotalk-photo-2019-07-14-14-32-31.jpg)

Google I/O는 뭐지?

구글이 매년 진행하는 개발자 컨퍼런스로, 매년 한번 개최한다.

미국, 샌프란시스코에서 구글의 개발 관심사를 발표로 진행.

I/O는 Input&Out put, Innovation in the open을 의미

Google I/O extended : 구글 I/O에서 발표한 내용중

전세계 로컬그룹에서 다루고 싶은기술을 공유하는 행사.

Google I/O extended WebTech : 익스텐드에서 WebTech를다룬다.

첫번째 발표: Puppeteer Geting start

1. Puppeteer : Chorme / Chromium을컨트롤할수있는API Library
2. Chrome으로할수있는일을자동화할수있음

* e2e Testing
* SPA prerendering(미리랜더링해서저장한다)
* Web Site Crawling
* Generating PDF

3\. Maintain by Google : 신뢰성이높음

사실 노드 개발하면서 Puppteer은 친숙하게 많이 써봤다.

크롤링이나, 테스팅에서 마치 사용자처럼 무언가를 한다는 것은

큰 장점이다. (사실 혼자서 클릭하고 움직이는게 재미있다. 고스트 바둑왕?)

주요 구현은 Await을 많이 사용한다.

새롭게 알게된점 :

React-snap :SPA를 위한 Prerenderer

* SEO, Meta Tag Pre-render
* Vue, React에도사용가능

prerender에서 사용된다는 것은 처음 알았다. 나중에 한번 써보고싶다.

발표자 분의 로그인, 로그아웃 예제

로그인, 로그아웃예제

* [HyunSeob/puppeteer-getting-started](https://github.com/HyunSeob/puppeteer-getting-started) - github.com

2\. Hands on Portals

Micro Frontend란?

Micro service의 개념을 프론트에 적용

프론트를 분리하여 하나의 조직이 하나의 기능을 관리.

도메인을 모두 분리하고 JS 독립하는 방법이 있지만 쉽지않다.

개별DOM에각각의기능들을넣어주는 해결방법이 있다.

*Hands-on with Portal*

\: 포탈에서 다른곳으로 이동하기. (A site =&gt; B site)

사용자의 안좋은 사용경험.

(사용자가 돌아올까….)

다른 사이트간에 데이터를 유연하게 주고받으면서,

이동하는 방법은 없을까

* [Hands-on with Portals: seamless navigations on the Web \| web.dev](https://web.dev/hands-on-portals) - web.dev

포탈의 기능을 사용하면 html의 내용을 수정하면

좀더 유연하게 이동할 수 있다. 또한, Post message로 데이터 전달이 어렵지 않다.

해당 기능을 써보려면 크롬 카나리 버젼에서 포탈기능을 설정해야한다.

규모가 큰 웹사이트에서 유연하게 이어지는 사용자 경험을 위해 발전 가능성, 필요성이 보이는 기술이라 생각된다.

구글이 가면 많이 따라가는 추세라, 조만간 친숙한 기술이 되지않을까.

웹 어셈블리

요즘 웹어쎔블리 이야기를 많이 접하고 있다. 어셈블리...(전공 수업에서 고통이)

아무튼 웹에서 C, C++ 기능을 원활하게 활용할 수 있다면 앞으로 웹이 또다른 발전을 가져올거라 생각된다.

history of web assembly

태초의 Emscripten C/C+을JS으로 컴파일 할 수있도록 도와주는 SDK

LLVM bytecode를JS로컴파일

ams.js

JS에서고수준언어요소들을뺀다면?

* While, if 기초적인요소만 포함 메모리를 직접 제어한다고 보장한다면 C언어와유사한JS코드가됨.

마지막에는 유사 C언어말고 그냥 Web을 위한 어셈블리어를 만들면 어떨까로 발상의 전환.

기계어와 일대일 대응되는 명령어의집합.Emscripten은 WebAssembly binary로 출력하도록 방향을 전환

웹어셈블리를 사용하면 게임, 이미지, 비디오 편집에서 Native에 준하는 속도를 웹에서 낼수있게 도와준다.

기존 C, C++코드의 재사용성 증가.

활용성?

웹에서 돌아가는 닌텐도 에뮬레이터

* [torch2424/wasmboy](https://github.com/torch2424/wasmboy) - github.com

이미지 편집 기능

* [Squoosh](https://squoosh.app/) - squoosh.app

앞으로 다양하게 활용될 분야임에는 분명하다.

웹어셈블리라고 C, C++만 사용해야하는것은 아니다. 이미 TypeScript을 지원하고 있고

* [appcypher/awesome-wasm-langs](https://github.com/appcypher/awesome-wasm-langs) - github.com

지원예정 언어 리스트에 많은 언어를 지원하려고 준비하고 있다.

와 그러면 JS필요없나요?

WebAssembly는만능이 아님. JS와 비교하더라도 항상빠르지않음,

가벼운 작업을 하는데 굳이 웹어셈블리를 쓸 필요는 없다.

게임, 무거운 알고리즘에 적절히 사용하자.
