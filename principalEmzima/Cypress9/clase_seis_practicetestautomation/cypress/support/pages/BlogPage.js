import HomePage from './HomePage';

var data = {
    containtArticleText: 'Unlock Your Future: Selenium WebDriver Career Launcher',
    containAutorText: 'Dmitry Shyshkin',
    urlBlogText: 'https://practicetestautomation.com/blog/' 
}


var pageLocators = {
    titleArticleClass: '.post-811 > article > .post-header > .post-title',
    autorClass: '.post-811 > article > .post-header > .post-byline',
    linkHomeSel: '#menu-item-43 > a'
}

class BlogPage extends HomePage {

    get urlBlogExpected() {
        return data.urlBlogText;
    }
    get titleArticleTextExpected() {
        return data.containtArticleText;
    }    
    get autorTextExpected() {
        return data.containAutorText;
    }    

    getTitleArticle() {
        return cy.get(pageLocators.titleArticleClass);
    }
    getAutorArticle() {
        return cy.get(pageLocators.autorClass);
    }

    blogClick() {
        return this.getBlogLink().click();
    }
    homeClick() {
        return cy.get(pageLocators.linkHomeSel).click();
    }
    
}
export default BlogPage;