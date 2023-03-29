const nodemailer = require('nodemailer');

const available_products = new Set();

const transporter = nodemailer.createTransport({
	service: 'gmail',
	auth: {
		user: process.env.SCRAPPER_SMTP_MAIL,
		pass: process.env.SCRAPPER_SMTP_PASSWORD,
	},
});

async function lidl_scrapper()
{
	const url = process.env.SCRAPPER_URL;
	console.log(`Check URL: ${url}`);

	const response = await fetch(url);
	var text = await response.text();

	const regex = new RegExp('online ausverkauft', 'g');
	let is_sold = regex.test(text);
	let product_name = process.env.SCRAPPER_PRODUCT_NAME || "Product";

	if(is_sold){
		console.info(`Lidl ${product_name} is available`);
		if(!available_products.has(url)){
			let message = `${product_name} ${url} is available again!`;
			transporter.sendMail({
				from: `"Lidl Scrapper" <${process.env.SCRAPPER_SMTP_MAIL}>`,
				to: process.env.SCRAPPER_MAIL_TO,
				subject: `Lidl ${product_name} is available again ✔`,
				text: message,
				html: message,
			}).then(info => {
				console.log('Mail is sent');
				available_products.add(url);
			}).catch(console.error);
		}
	} else {
		console.info(`Lidl ${product_name} is sold`);
		available_products.delete(url);
	}
}

lidl_scrapper();
