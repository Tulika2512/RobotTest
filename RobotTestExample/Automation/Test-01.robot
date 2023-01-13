*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${URL}   https://www.saucedemo.com/
@{credentials}   standard_user   secret_sauce
@{information}   Jhon  Alberto
&{LoginPassword}   password=secret_sauce

*** Test Cases ***

SampleLoginTest
    [Documentation]  This is a sample login testcase

    set selenium speed  0.03 seconds
    Launch browser
    Login
    Adding Item To Cart
    Providing details for checkout process
    Return to homepage
    Logout

    LOG             Test completed
    log             This test was executed by %{username} on %{os}
    
*** Keywords ***

Launch browser
     Open Browser    ${URL}   Chrome
     Maximize Browser Window

Login
     Input Text      id=user-name  ${credentials}[0]
     Input Password  id=password   ${LoginPassword}[password]
     Click button    id=login-button

Adding Item To Cart
      Click button    id=add-to-cart-sauce-labs-backpack
      Click Link      class=shopping_cart_link

Providing details for checkout process
      Click button    id=checkout
      Input Text      id=first-name  ${information}[0]
      Input Text      id=last-name   ${information}[1]
      Input Text      id=postal-code  123456
      Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
      Click button    id=continue
      Click button    id=finish

Return to homepage
      Click button    id=back-to-products
      Click button    id=react-burger-menu-btn

Logout
      Click Link      id=logout_sidebar_link
      Close browser
