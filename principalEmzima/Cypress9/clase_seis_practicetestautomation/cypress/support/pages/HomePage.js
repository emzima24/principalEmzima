var data = {
    logoAltText: 'Practice Test Automation',
    imgAltText: 'Dmitry Shyshkin, your Selenium WebDriver instructor',
    subtitleHomeText: 'Hello',
    linkBlogText: 'Blog',
    linkCoursesText: 'Courses',
    linkPracticeText: 'Practice'
}


var pageLocators = {
    subtitleClass: '.post-title',
    logoClass: '.custom-logo',
    imgClass: '.wp-image-91',
    blogLinkId: '#menu-item-19 > a',
    coursesLinkId: '#menu-item-21 > a',
    practiceLinkId: '#menu-item-20 > a',
}

class HomePage {

    get logoAltExpected() {
        return data.logoAltText;
    }
    get imgAltExpected() {
        return data.imgAltText;
    }
    get subtitleHomeExpected() {
        return data.subtitleHomeText;
    } 

    get linkBlogExpected() {
        return data.linkBlogText;
    } 
    get linkCoursesExpected() {
        return data.linkCoursesText;
    } 
    get linkPracticeExpected() {
        return data.linkPracticeText;
    } 
    
    urlResponse() {
        return cy.url();
    }
    goWeblink() {
        return cy.visit('/');
    }
    getSubtitle() {
        return cy.get(pageLocators.subtitleClass);
    }
    getLogo() {
        return cy.get(pageLocators.logoClass);
    }
    getImagen() {
        return cy.get(pageLocators.imgClass);
    }
    getBlogLink() {
        return cy.get(pageLocators.blogLinkId);
    }
    getCoursesLink() {
        return cy.get(pageLocators.coursesLinkId);
    }
    getPracticeLink() {
        return cy.get(pageLocators.practiceLinkId);
    }
}
export default HomePage;