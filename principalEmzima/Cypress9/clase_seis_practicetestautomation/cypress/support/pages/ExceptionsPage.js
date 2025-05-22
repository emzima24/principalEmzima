import LoginPage from './LoginPage';

var data = {
    msgClickAddText: 'Row 2 was added',
    msgClickSaveAddText: 'Row 2 was saved',
    msgClickSaveEditText: 'Row 1 was saved',
    favoriteFoodText: 'Arepa',
    favoriteTwoFoodText: 'Caraotas',
    disableText: 'disable',
    attrStyleText: 'style',
    attrCssText: 'css',
    attrStyleExpectedText: 'display:',
    instructionsText: 'Push “Add” button to add another row',
    urlExceptionsText: 'https://practicetestautomation.com/practice-test-exceptions/' 
}

var pageLocators = {
    addButtonId: '#add_btn',
    msgClickAddId: '#confirmation',
    inputRowSel: '#row2 > .input-field',
    savedButtonSel: '#row2 > #save_btn',
    editButtonId: '#edit_btn',
    inputFieldClass: '.input-field',
    saveButtonEditSel: '#save_btn',
    instructionsId: '#instructions'
    
}

class ExceptionsPage extends LoginPage {

    get urlExceptionsExpected() {
        return data.urlExceptionsText;
    }
    get attrStyle() {
        return data.attrStyleText;
    }    
    get attrStyleExpected() {
        return data.attrStyleExpectedText;
    }
    get msgAddExpected() {
        return data.msgClickAddText;
    }
    get msgAddSaveExpected() {
        return data.msgClickSaveAddText;
    }
    get msgEditSaveExpected() {
        return data.msgClickSaveEditText;
    }
    get favoriteFoodValue() {
        return data.favoriteFoodText;
    }    
    get otherFavoriteFoodValue() {
        return data.favoriteTwoFoodText;
    } 
    get textDisable() {
        return data.disableText;
    }  
    get attrCss() {
        return data.attrCssText;
    }
    get instructionsTextExpected(){
        return data.instructionsText;
    }    

    getAddButton() {
        return cy.get(pageLocators.addButtonId);
    }
    getMsgAdd() {
        return cy.get(pageLocators.msgClickAddId);
    }
    getInputRow() {
        return cy.get(pageLocators.inputRowSel, {timeout:8000});
    }
    getSavedButton() {
        return cy.get(pageLocators.savedButtonSel,{timeout:10000});
    }
    getEditButton() {
        return cy.get(pageLocators.editButtonId);
    }
    getInputField() {
        return cy.get(pageLocators.inputFieldClass);
    }
    getEditSaveButton() {
        return cy.get(pageLocators.saveButtonEditSel);
    }
    getInstructionsText(){
        return cy.get(pageLocators.instructionsId);
    }

    exceptionsClick() {
        return this.getExceptionsLink().click();
    }
    addButtonClick() {
        return this.getAddButton().click();
    }
    savedButtonClick() {
        return this.getSavedButton().click();
    }
    editSavedButtonClick() {
        return  this.getEditSaveButton().click();
    }
    editButtonClick() {
        return this.getEditButton().click();
    }

    typeInputField(value) {
        return this.getInputField().type(value);
    }
    typeInputRow(value) {
        return this.getInputRow().type(value);
    }

    clearInputField(){
        return this.getInputField().clear();
    }

    searchInstructionsBody() {
        return cy.get('body').then(($body) => {
            if ($body.find(pageLocators.instructionsId).length) {
                cy.get(pageLocators.instructionsId).should('not.be.visible');
            } else {
                cy.log('El elemento de instrucciones fue eliminado del Body')
            }} 
        )}
    
}
export default ExceptionsPage;