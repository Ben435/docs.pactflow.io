---
id: implementing-the-provider-changes
title: Implementing the provider changes
---

The next step is to implement the changes that have been requested in the pact.

1. Open up the terminal for your provider project.

1. Run `make test` to make sure everything is passing before you start.

1. Get the URL of the new pact:
    * Go to your Pactflow account, find the new pact and click "VIEW PACT".
    * Copy the URL from the location bar (discarding any query parameters).

1. Run `PACT_URL=<PACT URL HERE> make test` again. This test should correctly fail with the error `Could not find key "color"` in the output.
    * 👉 This little "verify a custom pact" trick works because of the code in in `src/product/product.pact.test.js` that switches between doing a "fetch pacts for these tags" mode and a "verify the pact at the `$PACT_URL`" mode, based on whether or not the `$PACT_URL` is set. The `$PACT_URL` code path is normally used when the build is triggered by a "contract content changed" webhook, and allows us to verify just the changed pact.

1. Make the test pass by adding a `color` field to `product/product.js`, and adding the new color argument to the Product initialization lines in `product/product.repository.js` and the provider states in `product/product.pact.test.js`.

    ```js
    class Product {
        constructor(id, type, name, version, color) {
            this.id = id;
            this.type = type;
            this.name = name;
            this.version = version;
            this.color = color;
        }
    }
    ```

    ```js
    class ProductRepository {
        constructor() {
            this.products = new Map([
                ["09", new Product("09", "CREDIT_CARD", "Gem Visa", "v1", "green")],
                ["10", new Product("10", "CREDIT_CARD", "28 Degrees", "v1", "blue")],
                ["11", new Product("11", "PERSONAL_LOAN", "MyFlexiPay", "v2", "yellow")],
            ]);
        }
      }
    ```

    ```js
    const opts = {
        ...,
        stateHandlers: {
          "product with ID 10 exists": () => {
            controller.repository.products = new Map([
                ["10", new Product("10", "CREDIT_CARD", "28 Degrees", "v1", "green")]
            ]);
          },
          "products exist": () => {
            controller.repository.products = new Map([
              ["09", new Product("09", "CREDIT_CARD", "Gem Visa", "v1", "blue")],
              ["10", new Product("10", "CREDIT_CARD", "28 Degrees", "v1", "yellow")]
            ]);
          },
    ```

1. Run `PACT_URL=<PACT URL HERE> make test` and you should have a passing test suite. ✅

1. Commit and push your changes.

## Expected state by the end of this step

* A provider that implements the features required by the `feat/new-field` pact on its `master` branch.
* The new version of the provider is "deployed" to production.
* A passing provider build in Github Actions.
* A `feat/new-field` pact in Pactflow that still does not have a verification result.

## Conclusion

The `master` provider is now compatible with the `feat/new-field` pact. However, there is no verification result published for the `feat/new-field` pact, because it was only verified on a development machine, and we don't typically publish verification results from dev machines.

The next step is getting a result back to Pactflow so that the consumer knows they are safe to merge.
