---
layout  : wiki
title   : UML DISTILLED
summary : 
date    : 2023-10-02 14:19:23 +0900
updated : 2023-10-02 14:34:53 +0900
tag     : book
resource: 02/6F7C46-199E-5472-8345-C157D512CECD
toc     : true
public  : true
parent  : book
latex   : false
origin  : https://itcoin.tistory.com/772
---
* TOC
{:toc}

![img-1498](/resource/02/6F7C46-199E-5472-8345-C157D512CECD/01-img-1498.jpg)

* [UML Distilled 3판 - 한국어판](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=248070) - www.aladin.co.kr

## UML 을 보는 관점

![img-2](/resource/02/6F7C46-199E-5472-8345-C157D512CECD/02-img-2.png)

## 반복 공정과 폭포수 공정

### 폭포수

* 액티비티 기준
* 분석, 설계, 개발, 테스트반복 방식
* 프로젝트를 기능의 부분 집합으로 나눔.

## Rational Unified Process

* 공정 프레임워크
* 개발 사례 선택하기RUP의 4 단계
* 개념화 단계
* 상세화 단계
* 구축 단계
* 전이 단계

## Operation(pg. 55)

## 쿼리(query)

* 시스템의 상태를 바꾸지 않고 클래스 값을 가져가는 오퍼레이션

## 변경자(modifier)

* 상태를 변화시키는 오퍼레이션. Command라고도 불림
* 쿼리와 변경자의 차이는 관찰 가능한 상태(obseravable state)를 변경하는지 여부
* 변경자에서는 값을 리턴하지 않도록 작성

### 관찰 가능한 상태

* 외부에서 인지할 수 있는 상태
* 캐쉬를 변경하는 오페ㅓ레이션은 외부에서 보는 상태는 영향이 없다.

### 오퍼레이션과 메서드 차이

* 오퍼레이션은 추상화된 개념 자체
* 메서드는 오퍼레이션을 구현하는 것

## 의존 (pg. 58)

* 어떤 요소의 정의에 대한 변화가 다른 요소의 변화를 유발하는 것

## 중앙 제어(centralized control) vs 분산 제어(distributed control)

* 데이터와 데이터를 사용하는 행동을 한 곳에 놓는 것이 객체 지향 설계의 첫 번째 규칙.
* 작은 메소드를 많이 사용

## 컴포넌트

* 독립적으로 구입하고 업그레이드를 할 수 있는 부분
