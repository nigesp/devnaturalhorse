<%@ page import="dev.thenaturalhorse.co.za.ProductOption" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="admin">
        <g:set var="entityName" value="${message(code: 'productOption.label', default: 'ProductOption')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="secondary-masthead">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a href="/adminDashboard/index">Admin</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">Shop</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="/adminProduct/list">Products</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="/adminProduct/show/${productInstance?.id}">${productInstance?.name}</a> <span class="divider">/</span>
                    </li>
                    <li class="active">Create - Product Option</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="page-header">
                            <h1>Create New Product Option</h1>
                        </div>
                    </div>
                </div>
                <div class="span12">
                    <div class="slate">
                        <g:form class="form-horizontal" action="update" >
                            <fieldset>
                                <g:render template="/admin/productOption/form_edit"/>
                                <g:hiddenField name="id" value="${productOptionInstance?.id}" />
                                <g:submitButton name="update" class="btn btn-info" value="Update" />
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
