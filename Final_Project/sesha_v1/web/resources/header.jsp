<div class="row p-4 rounded-bottom shadow-lg align-items-center justify-content-around header-top">
    <div class="col-1">
    </div>
    <div class="col-1 logo">
        <a href="https://weave.cs.nmt.edu/apollo8/sesha/">
        <img src="https://icon-library.com/images/flat-icon-library/flat-icon-library-17.jpg"
             alt="site logo"
             width="60%"/>
        </a>
    </div>
    <div class="col-5 text-center site-name">
        <h1 id="siteName" class="text-start">
            <a id="seshaLogo" href="#">
                SESHA
            </a>
        </h1>
    </div>
    <div class="col-4 text-end login">
        <form  action="seshaServlet" method="post">   
            <input type="hidden" name="settings" value="yes">
            <button id="myCoursesButton" class="btn btn-outline-primary" type="submit" name="action" value="myCourses">My Account</button>
        </form>
            <!--
            <img 
            src="https://icons.veryicon.com/png/o/business/cloud-desktop/user-138.png" 
            width="9%"/>
            -->
    </div>
    <div class="col-1">
    </div>
</div>
<div class="row p-3 align-items-center justify-content-center text-center header-nav rounded">
    <div class="col-3">
    </div>
    <div class="col-5 nav-link">
        <div class="btn-group" role="group">
            <a type="button" id="storeButton"
                href="https://weave.cs.nmt.edu/apollo8/sesha/"
                class="btn btn-outline-primary">Store</a> 
            <form  action="seshaServlet" method="post">   
                <button id="myCoursesButton" class="btn btn-outline-primary" type="submit" name="action" value="myCourses">My Courses</button>
            </form>
            <a type="button" id="enterCodeButton"
                onclick="javascript:alert('TODO')"
                class="btn btn-outline-primary">Enter Code</a>
            <a type="button" id="supportButton"
                onclick="javascript:alert('Requested Empy By Instructor')"
                class="btn btn-outline-primary">Get Support</a>
            <a type="button" id="instructorButton"
                onclick="javascript:alert('Requested Empy By Instructor')"
                class="btn btn-outline-primary">Instructor Portal</a>
        </div>
    </div>
    <div class="col-4">
    </div>
</div>
