<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="Future_Me.edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="managerApp">
<head runat="server">
    <!--#include file="header.aspx"-->

    <title>Email2Future</title>
</head>
<body ng-controller="editCtrl">

    <form id="form2" name="form2" runat="server">
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
        </div>        <div class="container">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
                <div id="banner">
                    <h1>Send emails to yourself or your friends/family in the future</h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="registrationform">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Send <i class="fa fa-pencil pull-right"></i></legend>
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="To Email" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="tbEmail" runat="server" placeholder="Email" Text="{{mail.EmailTo}}" CssClass="form-control"
                                        TextMode="Email"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Subject" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="tbSubject" runat="server" placeholder="Subject" Text="{{mail.Subject}}" CssClass="form-control" require></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="Your Letter" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="tbLetter" runat="server" Text="{{mail.Letter}}" CssClass="form-control" Rows="3" TextMode="MultiLine" require></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="On date" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="txtDate" runat="server" Text="{{mail.DeliverOn | date:'MM/dd/yyyy' }}" CssClass="form-control" require></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="View" CssClass="col-lg-2 control-label"></asp:Label>
                                <div class="col-lg-10" style="display: inline-block;">
                                    <asp:RadioButtonList ID="rbtList" runat="server"
                                        RepeatDirection="Horizontal" RepeatLayout="Table">
                                        <asp:ListItem Text="Can Edit" Value="1" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Lock" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Hide" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit"/>
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" UseSubmitBehavior="False" />
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        <!--#include file="footer.aspx"-->
        <script type="text/javascript">
            var _UserName;
            PageMethods.getUserEmail(onSuccess, onFailure);
            function onSuccess(result) {
                _UserName = result;
            }

            function onFailure(error) {
                alert(error);
            }
            $("#form2").one('submit', function (e) {
                $(this).find('input[type="submit"]').attr('disabled', 'disabled');
                // get id user if is login
                var _idEmail = angular.element(document.querySelector('[ng-controller="editCtrl"]')).scope().mail.ID;
                var _email = $('#tbEmail').val();
                var _Subject = $('#tbSubject').val();
                var _Letter = $('#tbLetter').val();
                var _DeliverOn = $('#txtDate').val();
                var _ViewStatus = $("[id*=rbtList] input:checked").val();
                var url = "updateMail"; // the script where you handle the form input.
                
                $.ajax({
                    type: "POST",
                    url: url,
                    data: { ID: _idEmail, EmailTo: _email, Subject: _Subject, Letter: _Letter, DeliverOn: _DeliverOn, ViewStatus: _ViewStatus, userEmail: _UserName }, // serializes the form's elements.
                    success: function (data) {
                        alert("A letter is changed!"); // show response from the php script.
                        window.location.href = "manager.aspx";
                    },
                    error: function (error) {
                        alert("Error: Can not change you letter!");
                        $("#btnSubmit").attr("disabled", false);
                    }
                });

                e.preventDefault(); // avoid to execute the actual submit of the form.
            });
        </script>
        <script type="text/javascript">
            $(function () {
                $("#txtDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                });
            });
        </script>
        <script type="text/javascript">
            'use strict';
            managerApp.controller('editCtrl', function ($scope, myService, $http, $window) {
                $scope.mail = myService.get();
                if($scope.mail == {})
                {
                    $window.location.href = "manager.aspx";
                }
            });
        </script>
    </form>
</body>

</html>