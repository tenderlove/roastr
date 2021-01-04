# I made a roast

I was interested in the effects of carry-over cooking.  For Christmas I decided
to cook a ham, and I recorded the temperature of the ham while it was in the
oven and after I took it out of the oven.

## Temperature Recording Method

I used a [ThermoPro TP20](https://buythermopro.com/product/thermopro-tp-20-digital-wireless-meat-thermometer/) for measuring the temperature of the ham.  This thermometer broadcasts the temperature to a wireless monitoring unit.

I used an RTL-SDR dongle to intercept and record the temperature.
Specifically, I used the [Nooelec SDR
dongle](https://www.nooelec.com/store/sdr/sdr-receivers/nesdr-mini.html).  Then
I used the [rtl_433 project](https://github.com/merbanan/rtl_433) to intercept
and record the broadcast temperatures.

The thermometer broadcasts every 12 seconds, but sometimes the SDR dongle
didn't pick up the signal, so there is some missing data.

You can find all the recorded samples in `roast.json`.

## Roasting Environment

The roast weighed 5kg (11lbs), and I put it in to a 163C (325F) oven.  I pulled
it straight from the refrigerator and put it in the oven, so the roast
temperature starts out quite low.

I cooked the roast until it was 71C (160F), then pulled it from the oven.  I
let it rest for 1 hour, glazed it, then put it in to a 232C (450F) oven for 20
min in order to brown the glaze.

After the glaze was done, I took it out of the oven and let it rest for 20 min
and served.

## Photos

Below is the temperature graph. Blue samples were taken while the roast was in
the oven, red samples were taken while the roast was out of the oven.

![Temp Graph](/pics/roast.png)

Here is a photo of the roast before I cooked it:

![before cooking](/pics/PC240029.png)

Here is a photo after cooking:

![after cooking](/pics/PC250033.png)
