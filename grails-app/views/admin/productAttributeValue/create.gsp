<%@ page import="dev.thenaturalhorse.co.za.Product" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="admin">
        <title></title>
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
                    <li class="active">Create</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="page-header">
                            <h1>Create New Product Attribute Value</h1>
                        </div>
                    </div>
                </div>
                <div class="span12">
                    <div class="slate">
                        <g:form class="form-horizontal" action="save" >
                            <fieldset>
                                <g:each in="${productAttributeInstance?.values}" var="val" status="i">
                                    <div class="control-group">
                                        <g:if test="${i == 0}">
                                            <label class="control-label">Current values</label>
                                        </g:if>
                                        <div class="controls">
                                            <g:textField name="val" value="${val?.value}" disabled="true"/>
                                        </div>
                                    </div>
                                </g:each>
                                <g:render template="/admin/productAttributeValue/form"/>
                                <g:hiddenField name="productAttributeId" value="${productAttributeInstance?.id}" />
                                <g:submitButton name="create" class="btn btn-info" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
