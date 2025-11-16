*** Settings ***
Resource  resource.robot

*** Test Cases ***
Register With Valid Username And Password
    Input New Command
    Input Credentials  arto  salasana1
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    # luodaan ensin käyttäjä
    Input New Command
    Input Credentials  arto  salasana1
    # yritetään luoda sama käyttäjä uudestaan
    Input New Command
    Input Credentials  arto  salasana2
    Output Should Contain  Username already exists

Register With Too Short Username And Valid Password
    Input New Command
    Input Credentials  ab  salasana1
    Output Should Contain  Username must be at least 3 characters long

Register With Enough Long But Invalid Username And Valid Password
    Input New Command
    Input Credentials  ab1  salasana1
    Output Should Contain  Username must contain only lowercase letters

Register With Valid Username And Too Short Password
    Input New Command
    Input Credentials  matti  short1
    Output Should Contain  Password must be at least 8 characters long

Register With Valid Username And Long Enough Password Containing Only Letters
    Input New Command
    Input Credentials  liisa  salasanaxx
    Output Should Contain  Password must contain at least one non-letter character


