import LoginPage from './LoginPage';

var data = {
    subtitleSuccessText: 'Logged In Successfully',
    subtextText: 'Congratulations student. You successfully logged in!',
}

var pageLocators = {
    subtextSel: '.has-text-align-center',
    loggoutButton:'.wp-block-button__link'
}

class HomeSuccessPage extends LoginPage {

    
    get subtextExpected() {
        return data.subtextText;
    }
    get subtitleSuccessExpected() {
        return data.subtitleSuccessText;
    }


    getSubtextDiv(){
        return cy.get(pageLocators.subtextSel)
    }
    
    loggoutClick() {
        return cy.get(pageLocators.loggoutButton).click();
    }
}
export default HomeSuccessPage;