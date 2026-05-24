___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "OpenAI Parameter Generator (Server)",
  "categories": [
  "UTILITY",  
  "ANALYTICS"
],
  "description": "Generates OpenAI-compatible contents, currency, and amount parameters from GA4 server event data.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "supported_parameters",
    "displayName": "Supported Parameters",
    "radioItems": [
      {
        "value": "contents",
        "displayValue": "contents",
        "help": "\u003ca href\u003d\"https://developers.openai.com/ads/conversions-api\" target\u003d\"_blank\"\u003e   Learn more about OpenAI Conversions API \u003c/a\u003e"
      },
      {
        "value": "currency",
        "displayValue": "currency",
        "help": "\u003ca href\u003d\"https://developers.openai.com/ads/conversions-api\" target\u003d\"_blank\"\u003e   Learn more about OpenAI Conversions API \u003c/a\u003e"
      },
      {
        "value": "amount",
        "displayValue": "amount",
        "help": "\u003ca href\u003d\"https://developers.openai.com/ads/conversions-api\" target\u003d\"_blank\"\u003e   Learn more about OpenAI Conversions API \u003c/a\u003e"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "CHECKBOX",
    "name": "ga4_event_data",
    "checkboxText": "Enable GA4 Event Data",
    "simpleValueType": true,
    "help": "Required for automatic GA4 event data mapping."
  }
]


___SANDBOXED_JS_FOR_SERVER___

const getEventData = require('getEventData');

/**
 * --------------------------------------------------------
 * OpenAI Parameter Generator (Server)
 * --------------------------------------------------------
 * Generates OpenAI-compatible contents, currency,
 * and amount parameters from GA4 server event data.
 * --------------------------------------------------------
 */

/**
 * --------------------------------------------------------
 * Event Data
 * --------------------------------------------------------
 */
const items = data.ga4_event_data === true ?
	(getEventData('items') || []) :
	[];

const currency = getEventData('currency') || '';
const value = getEventData('value') || 0;

/**
 * --------------------------------------------------------
 * Generate Contents
 * --------------------------------------------------------
 */
const contents = items.map(function(item) {

	return {

		id: item.item_id !== undefined ?
			item.item_id + '' :
			undefined,

		name: item.item_name !== undefined ?
			item.item_name + '' :
			undefined,

		content_type: data.content_type || 'product',

		quantity: item.quantity !== undefined ?
			item.quantity * 1 :
			undefined,

		amount: item.price !== undefined ?
			item.price * 1 :
			undefined,

		currency: currency || undefined
	};

});

/**
 * --------------------------------------------------------
 * Return Parameters
 * --------------------------------------------------------
 */
switch (data.supported_parameters) {

	case 'contents':
		return contents;

	case 'currency':
		return currency;

	case 'amount':
		return value * 1;

	default:
		return undefined;
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "items"
              },
              {
                "type": 1,
                "string": "currency"
              },
              {
                "type": 1,
                "string": "value"
              }
            ]
          }
        },
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 5/24/2026, 6:54:28 AM


