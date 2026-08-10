---
layout  : wiki
title   : JAVASCRIPT IS EVERYWHERE-1
summary : 
date    : 2019-06-23 20:33:36 +0900
updated : 2019-06-23 20:33:46 +0900
tag     : seminar
resource: 01/72A8B4-F00E-4E52-8CC8-B3D4D84719DA
toc     : true
public  : true
parent  : seminar
latex   : false
origin  : https://itcoin.tistory.com/13
---
* TOC
{:toc}

2019년 06월 23일 자바스크립트 커뮤니티 행사에 다녀왔습니다.

![a](/resource/01/72A8B4-F00E-4E52-8CC8-B3D4D84719DA/01-a.jpg)

행사장 입구

갈때마다 느끼는거지만, 마소 건물에서 하는 세미나는 기대가 됩니다.

첫 세션에서 저는 Deno is coming 이라는 주제의 발표를 들었습니다.

![c](/resource/01/72A8B4-F00E-4E52-8CC8-B3D4D84719DA/02-c.jpg)

node를 만든 라이언달이 새롭게 deno를 만들었습니다.

예전부터 deno라는 말은 들었는데, no de를 de no로 표기해서 데노가 된건

처음 알았습니다.

deno는 2018년 V8, Rust, tokio 를 기반으로 개발되어 발표되었고,

node에서 제대로 챙기지 못했던 요소들(security, promise 등) 을 적극 반영하다고 합니다.

일례로, deno실행시 프로젝트의 path 접근을 명시해야된다든지

보안을 많이 고민을 한것같습니다.

아직은 버그나 속도, 개선사항이 많이 남아있다고 합니다.

출시된지 오래되지않았고, 계속하여 버전업 중이라

조만간 성능이 더욱 좋아질것이라 예상되고 있습니다.

또한 typescript같이 다른 언어, 라이브러리와의 조합으로

앞으로 발전 가능성도 기대되고 있습니다 .

더 많은 자료는

* [Deno for korea](https://denoland.kr/) - denoland.kr

아직까지 발전단계라서 바로 현업적용 하기는 힘들것 같다.

아무튼 deno is coming!

2번째 세션은 React, TS, Electron Application 개발하면서 내가 실수한 것들 / 장기영

을 들었습니다.

SQL GATE를 개발하면서 경험했던 이슈를 주로 다뤄주셨습니다. SQL GATE 개발글을 예전에 okky에서

본것같은데 발표자로 나와주셔서 반가웠습니다.

개발자가 프로젝트에 들어가게 되면 정말 다양한 이슈들을 마주하게됩니다.

동시에 다양한 삽질을 하게됩니다. 이러한 문제해결을 하면서

해결방법을 정리하고 다시 리뷰를 하신게 인상깊었습니다.

![d](/resource/01/72A8B4-F00E-4E52-8CC8-B3D4D84719DA/03-d.jpg)

어떤 이슈가 있었고, 그 이슈를 어떻게 해결했는지

그리고 codepen으로 깔끔하게 정리해둔다면

나중에 같은 이슈가 생기더라도 해결기간을 단축할 수 있을 것같습니다.

3번째 세션은

여기 React Native 2인분이요! / 강명구

을 들었습니다.

왜 2인분인지는 리액트 네이티브가 크로스 플렛폼이기 때문입니다.

iOS, Andriod 각각 개발하던것을 RN하나로 개발하게 된다면

1소스 개발을 통해, 효율성이 올라가기때문입니다. ~~클라이언트에게는 iOS, AOS 두개 개발해서 2개만큼의 보수를~~)

RN 단점은 너무 잦은 업데이트에 대응하기가 쉽지않습니다. JS와 native간의 버그 문제가 생길수 있습니다.

RN 개발자가 수요에 비해 부족합니다. Flutter라는 구글이 지원하는 경쟁자가 나타났습니다.

RN의 개발은 기존의 React 개발과 비슷합니다. componet, props, state라는 큰줄기에서 개발을 하게됩니다.

component에서 bottom up방식을 많이 취합니다. props는 외부에서 상위-&gt; 하위로 영향을 끼치는 것을 말하고

state는 UI에 영향을 끼칠 수 있는 내부 데이터를 말합니다.

* [Expo](https://expo.io/) - expo.io

개발 환경에는 Expo, React Native CLi가 있는데

Expo의 경우에는 hot reload, 개발화면을 확인하는데 편리한 점이 있습니다.

하지만 build시 20mb이 넘는 용량, 추가 네이티브 모듈을 추가하기 어려움이 있습니다(블루투스, SNS 로그인기능등등)

RN의 최신버젼에 대응하기 힘들기 때문에 배포용으로 추천은 안한다고 하셨습니다.

React Native CLi은 프로덕션용으로 추천하셨습니다.

[https://reactnavigation.org/](https://reactnavigation.org/)

네비게이션용으로 react navigation

-React Native 버젼업 팁

react native upgrade 을 하는게 공식이지만, 알 수 없는 오류가 많이 발생합니다.

이 경우 온라인에서 dump up등을 찾아봐서 버젼별 차이를 보여주는 사이트에 들어가서

A -&gt; B 버젼으로 달라진 부분을 체크하여 수동으로 업데이트를 하는 것을 추천해주셨습니다.

* [microsoft/react-native-code-push](https://github.com/microsoft/react-native-code-push) - github.com

* [App Center](https://appcenter.ms/sign-in) - appcenter.ms

App 센터와 code push를 이용하여 CI/CD 팁도 배울 수 있었습니다.
