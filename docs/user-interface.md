---
id: user-interface
title: Pactflow User Interface Help
---

## Main Screen

The main Pactflow screen has four functional areas.

&nbsp;

![Main Screen](assets/ui/main-screen.png)

&nbsp;

<img src="assets/ui/one.png" alt="one" style="float: left; padding-right: 5px"/>
The list of all integrations are displayed on the left panel. An integration here is the pair of a consumer and provider that have a pact. Select an integration to have its details displayed in the center panel. The status icon (see table below) will be displayed for the verification result of latest pact.

<img src="assets/ui/two.png" alt="two" style="float: left; padding-right: 5px"/>
The details of the selected integration will be displayed here.

<img src="assets/ui/three.png" alt="three" style="float: left; padding-right: 5px"/>
You can filter the list of integrations here by either the Consumer or Provider name.

<img src="assets/ui/four.png" alt="four" style="float: left; padding-right: 5px"/>
The tabs at the top provide different views of the currently selected integration. The Network
Diagram will display a graph view of all the integrations that are reachable from the selected one.
The Matrix will display more details of all the pacts and verifications of the selected integration.

<img src="assets/ui/five.png" alt="five" style="float: left; padding-right: 5px"/>
The settings (or cog) button will take you to all the setting screens. Here you'll be able to setup
[API tokens](#settings-api-tokens) and [webhooks](#settings-webhooks).

&nbsp;

<div class="status-table">

| Status | Description |
|-------------|-------------|
| ![success](assets/ui/success.png) | The pact has a successful verification published for it. |
| ![failed](assets/ui/failed.png) | The latest verification for the pact had failed. |
| ![unverified](assets/ui/unverified.png) | No verification result has been published for the pact. |
| ![waiting](assets/ui/waiting.png) | A new version of the pact has been published since the last verification result was received. |

</div>

## Settings

## Settings - Webhooks

Here you will be able to create and edit your webhooks.

| Field | Description |
| ----- | ----------- |
| Description | A description of your webhook |
| Consumer | You can select a specific consumer for the webhook, or `ALL` for all consumers.  |
| Provider | You can select a specific provider for the webhook, or `ALL` for all providers. |
| Events | Select the events for which you want the webhook to fire (Mandatory to select one). |
| Method | The HTTP Method to use. Defaults to a POST. |
| URL | The URL to send the webhook request to (Mandatory). You can use dynamic variables in this field. |
| Headers | Headers as `KEY: VALUE` pairs to set on the request. |
| Body | The body of the request. You can use dynamic variables in the body. |
| Basic auth username | The username to use if your webhook requires Basic HTTP authentication |
| Basic auth password | The password to use if your webhook requires Basic HTTP authentication |
| Enabled | Uncheck this if you wish to disable the webhook |

### Dynamic Variables

The following variables may be used in the path of the URL, the query parameters and body, and will be replaced with their appropriate values at runtime.

| Expression | Description |
| ---------- | ----------- |
| ${pactbroker.consumerName} | The consumer name |
| ${pactbroker.providerName} | The provider name |
| ${pactbroker.pactUrl} | The URL to the newly published or most recently verified pact |
| ${pactbroker.verificationResultUrl} | The URL to the relevant verification result |
| ${pactbroker.githubVerificationStatus} | The verification status using the correct keywords for posting to the the Github commit status API |
| ${pactbroker.consumerVersionNumber} | The version number of the most recent consumer version associated with the pact content |
| ${pactbroker.providerVersionNumber} | The provider version number for the verification result |
| ${pactbroker.consumerVersionTags} | The list of tag names for the most recent consumer version associated with the pact content, separated by ", " |
| ${pactbroker.providerVersionTags} | The list of tag names for the provider version associated with the verification result, separated by ", " |
| ${pactbroker.consumerLabels} | The list of labels for the consumer associated with the pact content, separated by ", " |
| ${pactbroker.providerLabels} | The list of labels for the provider associated with the pact content, separated by ", " |

## Settings - API Tokens

Here you can copy and re-generate your API tokens. There are two tokens you can use, a read only token 
for anything that needs to download pacts, and a read-write token for anything required to publish 
pact files or verification results.