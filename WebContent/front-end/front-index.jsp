<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

<head>
    <title>BookShop</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-front.css" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/header.css" />
</head>

<body>
    <!-- Header -->
    <jsp:include page="/front-end/header/header.jsp"/>
    <!-- Banner -->
    <section class="banner full">
        <article>
            <img src="<%=request.getContextPath()%>/front-end/images/slide01.jpg" alt="" />
            <div class="inner">
                <header>
                    <p>Content1</p>
                    <h2>Ad1</h2>
                </header>
            </div>
        </article>
        <article>
            <img src="<%=request.getContextPath()%>/front-end/images/slide02.jpg" alt="" />
            <div class="inner">
                <header>
                    <p>Content2</p>
                    <h2>Ad2</h2>
                </header>
            </div>
        </article>
        <article>
            <img src="<%=request.getContextPath()%>/front-end/images/slide03.jpg" alt="" />
            <div class="inner">
                <header>
                    <p>Content3</p>
                    <h2>Ad3</h2>
                </header>
            </div>
        </article>
        <article>
            <img src="<%=request.getContextPath()%>/front-end/images/slide04.jpg" alt="" />
            <div class="inner">
                <header>
                    <p>Content4</p>
                    <h2>Ad4</h2>
                </header>
            </div>
        </article>
        <article>
            <img src="<%=request.getContextPath()%>/front-end/images/slide05.jpg" alt="" />
            <div class="inner">
                <header>
                    <p>Content5</p>
                    <h2>Ad5</h2>
                </header>
            </div>
        </article>
    </section>
    <!-- One -->
    <section id="one" class="wrapper style2">
        <div class="inner">
            <div class="grid-style">
                <div>
                    <div class="box">
                        <div class="image fit">
                            <img src="<%=request.getContextPath()%>/front-end/images/pic02.jpg" alt="" />
                        </div>
                        <div class="content">
                            <header class="align-center">
                                <p>maecenas sapien feugiat ex purus</p>
                                <h2>book shop</h2>
                            </header>
                            <p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
                            <footer class="align-center">
                                <a href="#" class="button alt">Learn More</a>
                            </footer>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="box">
                        <div class="image fit">
                            <img src="<%=request.getContextPath()%>/front-end/images/pic03.jpg" alt="" />
                        </div>
                        <div class="content">
                            <header class="align-center">
                                <p>mattis elementum sapien pretium tellus</p>
                                <h2>lecture</h2>
                            </header>
                            <p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
                            <footer class="align-center">
                                <a href="#" class="button alt">Learn More</a>
                            </footer>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="box">
                        <div class="image fit">
                            <img src="<%=request.getContextPath()%>/front-end/images/pic03.jpg" alt="" />
                        </div>
                        <div class="content">
                            <header class="align-center">
                                <p>mattis elementum sapien pretium tellus</p>
                                <h2>forum</h2>
                            </header>
                            <p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
                            <footer class="align-center">
                                <a href="#" class="button alt">Learn More</a>
                            </footer>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="box">
                        <div class="image fit">
                            <img src="<%=request.getContextPath()%>/front-end/images/pic03.jpg" alt="" />
                        </div>
                        <div class="content">
                            <header class="align-center">
                                <p>mattis elementum sapien pretium tellus</p>
                                <h2>reader Club</h2>
                            </header>
                            <p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
                            <footer class="align-center">
                                <a href="#" class="button alt">Learn More</a>
                            </footer>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Two -->
    <section id="two" class="wrapper style3">
        <div class="inner">
            <header class="align-center">
                <p>Nam vel ante sit amet libero scelerisque facilisis eleifend vitae urna</p>
                <h2>Morbi maximus justo</h2>
            </header>
        </div>
    </section>
    <!-- Three -->
    <section id="three" class="wrapper style2">
        <div class="inner">
            <header class="align-center">
                <p class="special">Nam vel ante sit amet libero scelerisque facilisis eleifend vitae urna</p>
                <h2>Morbi maximus justo</h2>
            </header>
            <div class="gallery">
                <div>
                    <div class="image fit">
                        <a href="#"><img src="<%=request.getContextPath()%>/front-end/images/pic01.jpg" alt="" /></a>
                    </div>
                </div>
                <div>
                    <div class="image fit">
                        <a href="#"><img src="<%=request.getContextPath()%>/front-end/images/pic02.jpg" alt="" /></a>
                    </div>
                </div>
                <div>
                    <div class="image fit">
                        <a href="#"><img src="<%=request.getContextPath()%>/front-end/images/pic03.jpg" alt="" /></a>
                    </div>
                </div>
                <div>
                    <div class="image fit">
                        <a href="#"><img src="<%=request.getContextPath()%>/front-end/images/pic04.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer -->
    <jsp:include page="/front-end/footer/footer.jsp"/>
    <!-- Scripts -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.scrollex.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/skel.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/util.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
</body>

</html>