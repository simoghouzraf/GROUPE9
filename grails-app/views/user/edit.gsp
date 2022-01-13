<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>
<section class="row colset-2-its"><fieldset class="form">
    <div id="edit-user" class="content scaffold-edit" role="main">
        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form resource="${this.user}" method="PUT">

            <g:hiddenField name="version" value="${this.user?.version}"/>

            <div class="form-group">
                <label for="password">Password</label><input class="form-control" type="password" name="password"
                                                             value="" id="password">
            </div>

            <div class="form-group required">
                <label for="username">Username
                    <span class="required-indicator">*</span>
                </label><input class="form-control" type="text" name="username" value="${this.user.username}"
                               required="" id="username">
            </div>

            <div class="form-group">
                <label style="display: none;" for="passwordExpired">Password Expired</label><input type="hidden"
                                                                                                   name="_passwordExpired"><input
                    type="hidden"
                    class="form-control" type="checkbox" name="passwordExpired" id="passwordExpired">
            </div>

            <div class="form-group">
                <label style="display: none;" for="accountLocked">Account Locked</label><input type="hidden"
                                                                                               name="_accountLocked"><input
                    type="hidden"
                    class="form-control" type="checkbox" name="accountLocked" id="accountLocked">
            </div>

            <div class="form-group">
                <label style="display: none;" for="accountExpired">Account Expired</label><input type="hidden"
                                                                                                 name="_accountExpired"><input
                    type="hidden"
                    class="form-control" type="checkbox" name="accountExpired" id="accountExpired">
            </div>

            <div class="form-group">
                <label style="display: none;" for="enabled">Enabled</label><input type="hidden" name="_enabled"><input
                    type="hidden"
                    class="form-control"
                    type="checkbox"
                    name="enabled"
                    checked="checked"
                    id="enabled">
            </div>

            <div class="form-group">
                <label for="role">Rôle</label>
                <g:select class="form-control"
                          from="${tp.mbds.com.Role.list()}" name="role"
                          optionKey="id"
                          optionValue="authority" value="${this.user.getAuthorities()[0].id}"/>
            </div>
            <g:submitButton name="update" class="btn btn-primary" type="submit"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>

        </g:form>
    </div>
</section>
</body>
</html>
