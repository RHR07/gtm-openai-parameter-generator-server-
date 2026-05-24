# OpenAI Parameter Generator (Server)

Generates OpenAI-compatible contents, currency, and amount parameters from GA4 server event data.

## Features

* Supports GA4 server-side event data
* Generates OpenAI-compatible contents parameter
* Returns currency and amount values
* Compatible with GTM server containers
* Minimal permission usage
* GTM Community Template Gallery compatible

## Supported Parameters

* `contents`
* `currency`
* `amount`

## Setup

### Contents

Use:

```text
{{tp - openai contents}}
```

### Currency

Use:

```text
{{tp - openai currency}}
```

### Amount

Use:

```text
{{tp - openai amount}}
```

## Requirements

Enable:

```text
Required for automatic GA4 event data mapping.
```

This automatically maps:

* `items`
* `currency`
* `value`

from GA4 server event data.

## Permissions

Required Event Data Keys:

```text
items
currency
value
```

## Resources

* https://developers.openai.com/ads/conversions-api
* https://developers.google.com/tag-platform/tag-manager/server-side/common-event-data
