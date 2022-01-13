<%@ page import="tp.mbds.com.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <div id="create-saleAd" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.saleAd}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.saleAd}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:uploadForm controller="saleAd" action="save" method="POST">
                <fieldset class="form">
                    <div class="form-group required">
                        <label for="title">Title
                            <span class="required-indicator">*</span>
                        </label><input class="form-control" type="text" name="title" value="" required="" id="title">
                    </div>

                    <div class="form-group required">
                        <label for="description">Description
                            <span class="required-indicator">*</span>
                        </label><input class="form-control" type="text" name="description" value="" required=""
                                       id="description">
                    </div>

                    <div class="form-group required">
                        <label for="longDescription">Long Description
                            <span class="required-indicator">*</span>
                        </label><textarea class="form-control" type="text" name="longDescription" required=""
                                          id="longDescription"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="filename0">Illustration(s)</label>

                        <input class="form-control" type="file" name="filename0" id="filename0">

                        <br>

                        <div class="content" id="wrapper"></div>

                        <input class="form-control" type="button" id="more_fields" onclick="add_fields();
                        add()" value="Ajouter une illustration">
                    </div>

                    <div class="form-group required">
                        <label for="price">Price
                            <span class="required-indicator">*</span>
                        </label><input class="form-control" type="number decimal" name="price" value="" required=""
                                       min="0.0"
                                       id="price">
                    </div>


                    <div class="form-group required">
                        <label for="author">Author
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select class="form-control" name="author" from="${tp.mbds.com.User.list()}"
                                  optionKey="id"
                                  optionValue="username"/>
                    </div>
                    <g:submitButton class="btn btn-primary" name="create"
                                    value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                </fieldset>
            </g:uploadForm>
        </div>
    </section>
</div>
<script>
    var i = 1;

    function add() {
        i++;
    }

    function add_fields() {
        document.getElementById('wrapper').innerHTML += '<input class="form-control" type="file" name="filename' + i + '" id="filename' + i + '"><br>\r\n';
    }
</script>
</body>
</html>
