<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manager.aspx.cs" Inherits="Future_Me.manager" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="managerApp">
<head runat="server">
    <!--#include file="header.aspx"-->
    <link rel="stylesheet" href="css/style_table.css">
    <title>Email2Future</title>
</head>
<body ng-controller="mailsCtrl">
    <form id="myForm" name="myForm" runat="server">
        <!--#include file="topbar.aspx"-->
        <div class="container">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="registrationform">
                    <div class="form-horizontal">
                        <table>
                            <thead>
                                <tr>
                                    <th>To Email</th>
                                    <th>Subject</th>
                                    <th>Letter</th>
                                    <th>On date</th>
                                    <th>Status</th>
                                    <th>View Status</th>
                                    <th>Control</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="mail in mails">
                                    <td>{{mail.EmailTo}}</td>
                                    <td>{{mail.Subject}}</td>
                                    <td>{{mail.Letter}}</td>
                                    <td>{{mail.DeliverOn}}</td>
                                    <td>{{mail.ViewStatus}}</td>
                                    <td>{{mail.Status}}</td>
                                    <td>{{mail.email}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--#include file="footer.aspx"-->
        
        <script type="text/javascript">
            'use strict';
            var _UserName = "<%= HttpContext.Current.User.Identity.Name %>";
            
            managerApp.controller('mailsCtrl', function ($scope, $http) {
                var user = { email: _UserName };
                $http.post('getMailOf', user).success(function (data) {
                    $scope.mails = data;
                });
            });
        </script>
    </form>
</body>
</html>

