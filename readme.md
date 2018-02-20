# Online tax software 1099-B submitter

For a tax software product, adding individual taxable can be time-consuming if you make a lot of trades. Simplify this by grabbing your cookie and putting your sales data into a CSV table, then running this script to automatically add your sales.

## Files required to run
`cookie.txt` - Your cookie from the tax software website, to identify you.
`domain.txt` - The domain of the tax software you're using, including TLD. ex: `"www.taxdefeater.com"`
`stocks.csv` - A comma-separated table containing stock sale information, one entree per line. Format:

| Security name (no spaces, max 15 characters) | mm/dd/yyyy date bought | mm/dd/yyyy date sold | sale price | Cost price |

All rows will be entered with `Box 3 Cost Basis Reported to the IRS`. If you need to use one of the other options, you'll need to change `DType` in the body of the request in taxes.sh to B or C for the second or third choices respectively.
