class InventoryPage {
  constructor(page) {
    this.page = page;
    this.pageTitle = page.getByText('Products', { exact: true });
    this.inventoryItems = page.locator('.inventory_item');
    this.shoppingCartLink = page.locator('.shopping_cart_link');
  }

  async isLoaded() {
    return this.pageTitle.isVisible();
  }

  async getItemCount() {
    return this.inventoryItems.count();
  }
}

module.exports = { InventoryPage };
