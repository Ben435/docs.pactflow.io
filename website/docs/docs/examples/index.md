---
id: index
title: Pactflow Code Demos
sidebar_label: Overview
---

## Introduction

We have created a number of example projects and demo material that you can use as references for your rolling out your contract-testing initiatives.

## Resources

Here are some useful resources when it comes to engaging your teams to help with Pact or contract-testing related initiatives:

| Resource | Description | Download |
| ---- | ----------- | -------- | -------- |
| Demo Pack | A general demo pack for introducing Pact & the concepts of contract testing | <a href="/resources/pactflow-demo-pack_2020.pdf" target="_blank">pdf</a> \| <a href="/resources/pactflow-demo-pack_2020.pptx" target="_blank">pptx</a> |


## Scenarios

### Product Catalog System (HTTP/Messages)

Our standard example is a product catalog website (see React above) which consumes a basic Products API implementing the following HTTP interface. All demo languages implement this interface so that we can easily mix and match technologies.

| Endpoint | Example Response |
| -------- | ---------------- |
| `GET /products` | `[{"id":"09","type":"CREDIT_CARD","name":"Gem Visa","version":"v1"},{"id":"10","type":"CREDIT_CARD","name":"28 Degrees","version":"v1"},{"id":"11","type":"PERSONAL_LOAN","name":"MyFlexiPay","version":"v2"}]`
| `GET /product/1` | `{"id":"09","type":"CREDIT_CARD","name":"Gem Visa","version":"v1"}`

:::info
The single get product endpoint is not a spelling mistake, and is used to show evolution to more standard resource based design
:::

## Demos

### Consumers

| Language | Use Case | Framework/Tech | Description |
| --------- | ------- | ----------- | -------------- |
| JS/NodeJS | Web | [React](js/consumer/readme) | React JS website relying on a Products API |
| JS/NodeJS | Web | [Cypress](cypress/readme) | Example demonstrating how Cypress could be used to generate consumer pacts |
| Java | Messages | [Kafka](kafka/java/consumer) | Java Kafka consumer |
| NodeJS | Messages | [Kafka](kafka/js/consumer) | NodeJS Kafka consumer |
| Java | SOAP | [Java](soap/java/consumer) | Java SOAP API consumer (_note: only compatible with the SOAP provider_) |
| .NET | API | [.NET](dotnet/consumer/readme) | .NET Products API consumer |

### Providers

| Language | Use Case | Framework/Tech | Description |
| --------- | ------- | ----------- | -------------- |
| JS/NodeJS | API | [Express JS](js/provider/readme) | ExpressJS API provider |
| Java | API | [Spring Boot](java/provider-springboot/readme) | Java Spring Boot API provider |
| Java | Messages | [Kafka](kafka/java/provider) | Java Kafka message provider |
| Java | SOAP | [Java](soap/java/provider)  | Java SOAP API provider (_note: only compatible with the SOAP consumer_) |
| .NET | API | [.NET](dotnet/provider/readme) | .NET API provider |