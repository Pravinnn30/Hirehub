<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=user_attributes" />
<header id="tp">
    <div class="top-bar">
        <div><a id="logo" href="index.jsp">Hirehub.com</a></div>

        <c:if test="${session_user != null}">
            <Form class="login-mode" action="logoutServlet" method="post">
                <span>Welcome, <strong>${session_user.username}</strong></span>
                <button type="submit" class="btn btn-outline-danger">logout</butoon>
            </form>
        </c:if>

        <c:if test="${session_user == null}">
            ${session_user}
            <div class="login-mode">
                <a href="login.jsp" class="btn btn-outline-success">login</a>
                <a href="signup.jsp" class="btn btn-outline-info">signup</a>
            </div>
        </c:if>

    </div>
    <nav class="navbar navbar-expand-lg bg-body-tertiary bottom-bar">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewJobServlet">View Jobs</a>
                    </li>

                    <c:if test="${session_user != null && session_user.getUserStatus().equals('admin')}">
                        <li class="nav-item">
                            <a class="nav-link" href="postjob.jsp">Add Job</a>
                        </li>
                    </c:if>

                    <li class="nav-item">
                        <a class="nav-link" href="aboutus.jsp">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contectus.jsp">Contects us</a>
                    </li>
                </ul>

                <form class="d-flex" action="viewJobServlet" method="get">
                    <input type="hidden" name="from" value="header">
                    <input class="form-control me-2" name="jobSearch" value="${jobSearch}" type="search" placeholder="Search by Title" aria-label="Search" required/>
                    <button class="btn btn-outline-success" type="submit">Search</button>
                    <c:remove var="jobSearch"/>
                </form>
            </div>
        </div>
    </nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        (function(){
            var breakpoint = 1024; // tablet and below
            function transformLoginMode() {
                var login = document.querySelector('.login-mode');
                if (!login) return;
                // store original once
                if (!login.dataset.originalHtml) login.dataset.originalHtml = login.innerHTML;

                if (window.innerWidth <= breakpoint) {
                    if (!login.classList.contains('compact')) {
                        login.classList.add('compact');
                        var original = login.dataset.originalHtml;
                        // create a compact dropdown-style button to house the original controls
                        login.innerHTML = ''+
                            '<div class="dropdown d-inline">' +
                                '<button id="loginCompactBtn" class="btn btn-outline-light" type="button" aria-expanded="false"><span class="material-symbols-outlined">user_attributes</span></button>' +
                                '<div class="compact-menu d-none">' + original + '</div>' +
                            '</div>';

                        
                        var name = document.getElementById("loginCompactBtn");
                        name.nextElementSibling.firstChild.nextElementSibling.style.color = '#1e293b';
                        var btn = login.querySelector('#loginCompactBtn');
                        var menu = login.querySelector('.compact-menu');
                        btn.addEventListener('click', function(e){
                            e.stopPropagation();
                            menu.classList.toggle('d-none');
                        });
                        // hide menu when clicking outside
                        document.addEventListener('click', function(){ if (!menu.classList.contains('d-none')) menu.classList.add('d-none'); });
                    }
                } else {
                    if (login.classList.contains('compact')) {
                        login.classList.remove('compact');
                        login.innerHTML = login.dataset.originalHtml || '';
                    }
                }
            }

            // run on load and resize
            document.addEventListener('DOMContentLoaded', transformLoginMode);
            window.addEventListener('resize', transformLoginMode);
        })();
    </script>

    <script>
        // Set the active nav-link based on current URL and on click
        (function(){
            function normalizeName(path) {
                if (!path) return '';
                var parts = path.split('/');
                return parts[parts.length-1];
            }

            function updateActive() {
                var navLinks = document.querySelectorAll('.bottom-bar .nav-link');
                var current = normalizeName(window.location.pathname) || '';
                if (!current) current = 'index.jsp';

                navLinks.forEach(function(link){
                    var url = link.getAttribute('href') || '';
                    var a = document.createElement('a');
                    a.href = url;
                    var linkName = normalizeName(a.pathname) || url;
                    // match exact file or route name
                    if (linkName === current || (current === '' && (linkName === 'index.jsp' || linkName === 'home.jsp'))) {
                        link.classList.add('active');
                    } else {
                        link.classList.remove('active');
                    }
                });
            }

            document.addEventListener('DOMContentLoaded', function(){
                updateActive();
                // add click handlers for immediate feedback
                document.querySelectorAll('.bottom-bar .nav-link').forEach(function(link){
                    link.addEventListener('click', function(){
                        document.querySelectorAll('.bottom-bar .nav-link').forEach(function(l){ l.classList.remove('active'); });
                        this.classList.add('active');
                    });
                });
            });
        })();
    </script>
</header>