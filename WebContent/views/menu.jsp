<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー</title>
<title>Tumbler's</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Agdasima&family=Shippori+Mincho&display=swap" rel="stylesheet">
</head>

<body>
<div class="container">
	<header class="header">
		<div class="header__inner">
			<h1 class="header__title header-title">
			<a href="../index.jsp">
			Tumbler's
			</a></h1>
			
			<nav class="header__nav nav" id="js-nav">
          		<ul class="nav__items nav-items">
		            <li class="nav-items__item"><a href="../index.jsp">ホーム</a></li>
		            <li class="nav-items__item"><a href="listview.jsp">商品一覧</a></li>
		            <li class="nav-items__item"><a href="login.jsp">ログイン</a></li>
		            <li class="nav-items__item"><a href="cart.jsp">カート</a></li>
         		 </ul>
         	</nav>
         	
         <button class="header__hamburger hamburger" id="js-hamburger">
          <span></span>
          <span></span>
          <span></span>
        </button>
	</div>
</header>

<%--JS --%>
<script>
const ham = document.querySelector('#js-hamburger');
const nav = document.querySelector('#js-nav');

ham.addEventListener('click', function () {

  ham.classList.toggle('active');
  nav.classList.toggle('active');

});
</script>


<%--CSS --%>
<style>
@charset "UTF-8";
/*
html5doctor.com Reset Stylesheet
v1.6.1
Last Updated: 2010-09-17
Author: Richard Clark - http://richclarkdesign.com
Twitter: @rich_clark
*/
.header{
font-family: 'Agdasima', sans-serif;
font-family: 'Shippori Mincho', serif;
}

html,
body,
div,
span,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
abbr,
address,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
samp,
small,
strong,
sub,
sup,
var,
b,
i,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section,
summary,
time,
mark,
audio,
video {
  margin: 0;
  padding: 0;
  border: 0;
  outline: 0;
  font-size: 100%;
  vertical-align: baseline;
  background: transparent;
}

body {
  line-height: 1;
}

article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section {
  display: block;
}

nav ul {
  list-style: none;
}

blockquote,
q {
  quotes: none;
}

blockquote:before,
blockquote:after,
q:before,
q:after {
  content: '';
  content: none;
}

a {
  margin: 0;
  padding: 0;
  font-size: 100%;
  vertical-align: baseline;
  background: transparent;
}

/* change colours to suit your needs */
ins {
  background-color: #ff9;
  color: #000;
  text-decoration: none;
}

/* change colours to suit your needs */
mark {
  background-color: #ff9;
  color: #000;
  font-style: italic;
  font-weight: bold;
}

del {
  text-decoration: line-through;
}

abbr[title],
dfn[title] {
  border-bottom: 1px dotted;
  cursor: help;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

/* change border colour to suit your needs */
hr {
  display: block;
  height: 1px;
  border: 0;
  border-top: 1px solid #cccccc;
  margin: 1em 0;
  padding: 0;
}

input,
select {
  vertical-align: middle;
}


/* 調整用スタイル */

a {
  text-decoration: none;
}



ul,
li {
  list-style: none;
}


main {
  background-color: #f1f1f1;
  height: 900px;
  display: flex;
}


.main {
  margin: auto;
}

.footer {
  background-color: #f6f6f6;
  height: 200px;
  display: flex;
}

.footer div {
  margin: auto;
}


/* ヘッダー */


.header {
  background-color: white;
  width: 100%;
  height: 50px;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 999;
}


@media screen and (min-width: 960px) {
  .header {
    height: 80px;

  }
}

main {
  margin-top: 80px; /* （※）の高さに合わせる */
  padding-left: 10px;
}


.header__inner {
  padding: 0 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: inherit;
  position: relative;
}


/* ヘッダーのロゴ部分 */
.header__title {
  width: 80px;
}


.header__title:hover {
  opacity: 0.8;
}


@media screen and (min-width: 960px) {
  .header__title {
    width: 140px;
  }
}

.header__title img {
  display: block;
  width: 100%;
  height: 100%;
}

/* ヘッダーのナビ部分 */

.header__nav {
  position: absolute;
  right: 0;
  left: 0;
  top: 0;
  width: 100%;
  height: 100vh;
  transform: translateX(100%);
  background-color: #fff;
  transition: ease .4s;

  display: flex;
}


@media screen and (min-width: 960px) {
  .header__nav {
    position: static;
    transform: initial;
    background-color: inherit;
    height: inherit;
    display: flex;
    justify-content: end;
    width: 40%;
  }
}


.nav__items {
  margin: auto;
}

@media screen and (min-width: 960px) {
  .nav__items {
    margin: initial;
    width: 100%;
    display: flex;
    align-items: center;
    height: initial;
    justify-content: space-between;
  }
}


.nav-items__item {
  cursor: pointer;
  position: relative;
  height: 100%;
  display: flex;
  align-items: center;

}

@media screen and (min-width: 960px) {

  .nav-items__item:before {
    position: absolute;
    content: "";
    bottom: -1px;
    left: 0;
    width: 100%;
    height: 2px;
    background: orange;
    opacity: 0;

  }

  .nav-items__item:hover:before {
    opacity: 1;
  }

}

/*PC時のナビゲーションメニュー、横並びにする*/
@media screen and (min-width: 960px) {
  .nav__items {
    width: 100%;
    display: flex;
    align-items: center;
    height: initial;
    justify-content: space-between;
  }
}


.nav-items {
  padding-top: 250px;
  padding-bottom: 200px;
}

@media screen and (min-width: 960px) {
.nav-items {
   padding-top: inherit;
   padding-bottom: inherit;
  }
}




/* ナビのリンク */
.nav-items__item a {
  color: black;
  width: 100%;
  display: block;
  text-align: center;
  font-size: 24px;
  margin-bottom: 24px;
}

.nav-items__item:last-child a {
  margin-bottom: 0;
}

@media screen and (min-width: 960px) {
  .nav-items__item a {
    margin-bottom: 0;
    font-size: 18px;
  }
}


/* ハンバーガーメニュー */
.header__hamburger {
  width: 48px;
  height: 100%;
}

.hamburger {
  background-color: transparent;
  border-color: transparent;
  z-index: 9999;
  cursor: pointer;
}

@media screen and (min-width: 960px) {
  .hamburger {
    display: none;
  }
}


/* ハンバーガーメニューの線 */
.hamburger span {
  width: 100%;
  height: 1px;
  background-color: #000;
  position: relative;
  transition: ease .4s;
  display: block;
}

.hamburger span:nth-child(1) {
  top: 0;
}

.hamburger span:nth-child(2) {
  margin: 8px 0;
}


.hamburger span:nth-child(3) {
  top: 0;
}


/* ハンバーガーメニュークリック後のスタイル */
.header__nav.active {
  transform: translateX(0);
}

.hamburger.active span:nth-child(1) {
  top: 5px;
  transform: rotate(45deg);
}


.hamburger.active span:nth-child(2) {
  opacity: 0;
}


.hamburger.active span:nth-child(3) {
  top: -13px;
  transform: rotate(-45deg);
}

</style>
</body>
</html>