<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="publicletters.aspx.cs" Inherits="Future_Me.publicletters" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <!--#include file="header.aspx"-->
    <meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="701272448744-o962ib0di7kft9s3p7jqmf8srhp9ed3r.apps.googleusercontent.com">
    <title>Email2Future</title>
</head>
<body>

    <form id="form1" name="form1" runat="server">
        <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.aspx">Email2Future</a>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                        <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse navbar-menubuilder">
                    <ul class="nav navbar-nav navbar-right" id="topbar" runat="server">
                        <li><a href="/">Home</a> </li>
                        <li><a href="/manager.aspx" id="managerLink" runat="server">Your mail</a> </li>
                        <li><a href="/publicletters.aspx">Public letters</a> </li>
                        <li><a href="/register.aspx" id="signUplink" runat="server">Sign up</a> </li>
                        <li><a href="/signin.aspx" id="signInlink" runat="server">Sign in</a> </li>
                        <li><a href="/signout.aspx" onclick="signOut();" id="signOutlink" runat="server">Sign Out</a> </li>
                        <%--<li><a href="#" onclick="signOut();">Sign Out</a> </li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="registrationform">
                    <div class="form-horizontal">
                        <fieldset runat="server" id="letterContain">
                            <legend>50 public letters from futureme.org <i class="fa fa-pencil pull-right"></i></legend>       
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        <!--#include file="footer.aspx"-->
       
    </form>
</body>

</html>