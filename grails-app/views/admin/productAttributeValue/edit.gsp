<%@ page import="dev.thenaturalhorse.co.za.Product" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="admin">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
    <body>
        <div class="secondary-masthead">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Admin</a> <span class="divider">/</span>
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
                    <li class="active">Edit</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="page-header">
                            <h1>Edit - </h1>
                        </div>
                    </div>
                </div>
                <div class="span12">
                    <div class="slate">
                        <g:form class="form-horizontal" action="update" >
                            <fieldset>
                                <g:render template="/admin/productAttributeValue/form"/>
                                <g:hiddenField name="productAttributeId" value="${productAttributeInstance?.product?.id}" />
                                <g:hiddenField name="id" value="${productAttributeValueInstance?.id}" />
                                <g:submitButton name="create" class="btn btn-info" value="${message(code: 'default.button.create.label', default: 'Update')}" />
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
