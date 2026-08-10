---
layout  : wiki
title   : OpenAPI와 스웨거를 활용한 실전 API 설계
summary : 
date    : 2024-04-27 10:58:04 +0900
updated : 2024-04-27 10:58:58 +0900
tag     : book
resource: 58/0FB00C-AF6C-5A5D-92A0-E11A0F85D7A8
toc     : true
public  : true
parent  : book
latex   : false
origin  : https://itcoin.tistory.com/816
---
* TOC
{:toc}

![img-2032](/resource/58/0FB00C-AF6C-5A5D-92A0-E11A0F85D7A8/01-img-2032.webp)

API 문서만드는 이야기인줄 알았는데 API 설계 이야기가 실전 예제로 나와 유용했다.

pg.206 배열을 리소스 최상위로 두지않는 이유. CORS같은 보안이슈 우회됨.
pg.207 컬렉션은 왜 404반환이 아닐까? 자원이 비어있을뿐 없는것은 아니기때문.
pg.214 create 도 서브리소스 경로 써야되나에 대한 이야기, 가능한 짧은 경로 추천
pg.218 url의 케밥 케이스를 사용하자
pg.218 approve. 자원의 변경의미로 PUT 메서드를 사용했다. 좋은 방법이지만 승인의 의미도 표현됐을까?
pg.326 포스텔법칙. 하이럼법칙. 쓰던대로 썼는데 왜 안돼죠? 법칙.
pg.406 problem detail. Spring6에도 정식으로 지원한다.
<https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/ProblemDetail.html>
pg.442, 446 path나 파라미터에 넣는 방법을 알고있었는데 미디어타입으로 버저닝 방법 소개해줘서 좋았다.
pg.465 일관성을 유지하는 메시지는 좋음. DTO로 리턴한다.
pg.496 프로덕션코드+문서. 프로덕션 코드에 열심히 주석다는 것의 회의감이 든다. yml을 작성해보면 어떨까.
