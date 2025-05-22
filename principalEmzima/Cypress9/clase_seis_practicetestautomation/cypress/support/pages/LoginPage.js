import HomePage from './HomePage';

var data = {
    testLoginText: 'Test Login Page',
    testExceptionsText: 'Test Exceptions',
    usernameValid: 'student',
    passwordValid: 'Password123',
    msgErrorUserText: 'Your username is invalid!',
    msgErrorPassText: 'Your password is invalid!',
    subtitleLoginText:'Test login',
    urlText: 'https://practicetestautomation.com/logged-in-successfully/' 
}


var pageLocators = {
    testLoginPageSele: ':nth-child(2) > [style="flex-basis:33.33%"] > p > a',
    testExceptionsPageSele: ':nth-child(4) > [style="flex-basis:33.33%"] > p > a',
    titleloginSel: 'h2',
    submitId: '#submit',
    msgErrorSel: '#error',
    inputUserId: '#username',
    inputPassId: '#password',
}

class LoginPage extends HomePage {

    get testLoginTextExpected() {
        return data.testLoginText;
    }
    get testExceptionsTextExpected() {
        return data.testExceptionsText;
    }
    get userValid() {
        return data.usernameValid;
    }
    get passValid() {
        return data.passwordValid;
    }
    get urlSuccessExpected() {
        return data.urlText;
    }
    get msgUserErrorExpected(){
        return data.msgErrorUserText;
    }
    get msgPassErrorExpected(){
        return data.msgErrorPassText;
    }
    get subtitleLoginExpected(){
        return data.subtitleLoginText;
    }
    get subtitleIntermediateExpected(){
        return this.linkPracticeExpected;
    }

    getExceptionsLink() {
        return cy.get(pageLocators.testExceptionsPageSele);
    }
    getLoginLink() {
        return cy.get(pageLocators.testLoginPageSele);
    }
    getTitleLoginPage() {
        return cy.get(pageLocators.titleloginSel, { timeout: 10000 })
    }
    getMsgError(){
        return cy.get(pageLocators.msgErrorSel)
    }

    typeUserInput(value){
        return cy.get(pageLocators.inputUserId).type(value)
    }
    typePassInput(value){
        return cy.get(pageLocators.inputPassId).type(value)
    }
    
    practiceClick() {
        return this.getPracticeLink().click();
    }
    loginClick() {
        return this.getLoginLink().click();
    }
    submitClick() {
        return cy.get(pageLocators.submitId).click();
    }
    loggoutClick() {
        return cy.get(pageLocators.loggoutButton).click();
    }
    
}
export default LoginPage;