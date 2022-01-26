# Git

다음의 내용을 읽어주세요...

1. 받을 때
2. 올릴 때
3. 충돌

<hr>

## 받을 때 절차

### 처음 받을 때

- git clone 주소값
- git branch -m main

 >
  git bash 에서 이미 main 으로 설정되어 있다면,
  git branch -m main 은 하지 않아도 됩니다.

<hr>

## 올릴 때 절차

1. **git fetch**            // 비교하기
2. **git pull**             // 비교해서 변화된 부분 가져오기

3. 담당하고 있는 부분 코드만 수정하기
4. git add .
5. git commit -m "커밋 메세지"
6. git push -u origin main

<hr>

## 충돌

### 충돌이란?

- 한 파일에 동시에 두 개의 수정사항이 있어서,
  둘 중 하나를 지우거나 둘 다 지워지거나 둘 다 합쳐지거나
  이상한 일이 벌어집니다.

### 충돌이 일어날 수 있는 상황

- 한 파일을 두 명이서 수정하고 있을 때 주로 일어납니다.

>
예를 들어, 제가 index.html 을 수정하고 있는데,
어떤 분이 어 뭐야 여기 오타 있네 하고 오타 수정 해줬다고 생각해봅시다.

>
그러면 그 분이 마지막으로 fetch, pull 받은 시점부터
제가 마지막으로 작성한 내용을 commit 한 시점까지의 코드는 다음과 같이 다를 겁니다.

```html
<!-- 누가 수정함 -->
<span>감자</span>
```

```html
<!-- 내가 작성중 -->
<span>감자</span>
<p>대충 무슨 내용들....</p>
```

>
이 때,
충돌이 일어나고 무지성으로 클릭하면,
파일 사라집니다.
말 그대로 사라져요.

### 충돌이 일어났을 때 주의 사항

- 절대로 버튼을 누르지 말 것

1. 그 어떤 버튼도 누르지말고 꼭 구글링하고 꼭 디스코드에서 공유해주세요. 꼭... 버튼을 누를수록 상황이 이상해집니다.

### 버튼을 눌렀을 때 주의 사항

- 말해주세요.

<hr>

## 커맨드 정리

### git fetch

내 컴퓨터 파일과 컴퓨터와 비교

### git pull

비교한 내용을 받아오기

### git log 또는 git reflog

commit 내역을 확인하고 싶을 떄 입력하면 됩니다.

git add .
git commit -m "커밋내용"

하고 난 이후에 제대로 커밋됐는지 확인하려면 위 커멘드를 입력하세요.

git log 는 좀 더 자세하게 나오고,
git reflog 는 좀 더 간략하게 나옵니다.