---
date: '2011-07-06 17:39:37'
layout: post
slug: pen-testing-silverlightria-with-soapui
status: publish
title: Pen-Testing Silverlight+RIA with SoapUI
wordpress_id: '957'
categories:
- Development
- Security
- Technology
tags:
- .NET
- Development
- Pen-test
- Security
- Silverlight
- SoapUI
- Web Development
---

I was recently given the task of ensuring that a Silverlight+RIA application that could contain private information was secure for deployment to a public web site. So I started searching for automated pen-testing tools that could work against Microsoft's Binary SOAP protocol (`msbin1`, a.k.a `application/soap+msbin1`) and found only disappointment. For various reasons, it's significantly more complex to pen-test a application using `msbin1` than traditional `SOAP` + `WSDL`.

To properly test the services, I had to make a compromise: temporarily modify the application to expose a `SOAP` endpoint. While this changes the state of the application and thus reduces the validity of the tests, it does provide a reasonable way of testing the web services to ensure that they are behaving as intended.

The recently released [SoapUI Pro 4](http://www.soapui.org/About-SoapUI/go-pro.html) adds new [security testing tools](http://www.soapui.org/Security/getting-started.html) that makes this a viable (and attractive option). To get this working, there are a few small changes that need to be made to the solution:

First, you'll need to add a reference to `Microsoft.ServiceModel.DomainServices.Hosting.EndPoints` which is part of the RIA Services Toolkit; this allows you to expose different End Points for the service such as `SOAP` and `OData`.

Next, you'll want to add the following `configSections` entry to your `Web.config`:

    <configuration>
     <configSections>
       <sectionGroup name="system.serviceModel">
         <section name="domainServices"
          type="System.ServiceModel.DomainServices.Hosting.DomainServicesSection,
          System.ServiceModel.DomainServices.Hosting,
          Version=4.0.0.0,
          Culture=neutral,
          PublicKeyToken=31bf3856ad364e35" />
       </sectionGroup>
     </configSections>
     ...

Finally, to expose the `SOAP` end point:

    <configuration>
     ...
     <system.serviceModel>
      ...
      <domainServices>
       <endpoints>
        <add name="Soap"
         type="Microsoft.ServiceModel.DomainServices.Hosting.SoapXmlEndpointFactory,
         Microsoft.ServiceModel.DomainServices.Hosting,
         Version=4.0.0.0,
         Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
       </endpoints>
      </domainServices>
      ...

Finally, just follow the [instructions](http://www.soapui.org/Security/security-scans-overview.html) for SoapUI to setup your tests, and you can feel (just a little) more confident in your application. Passing with flying colors obviously doesn't mean your application is bulletproof, but it helps to confirm that web service code is solid.

Now, while this does provide some insight into your application and should help find common issues, it's not a replacement for a professional assessment by a qualified auditor. If you are handling credit cards or other highly targeted information, _please_ consult a security specialist before a public deployment.
