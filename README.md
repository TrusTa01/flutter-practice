# Localization: Date & Time Formatting (ARB-driven)

This branch demonstrates how to format dates and times directly within `.arb` files using **Typed Placeholders**. This approach automates regional formatting, making the UI code cleaner and less error-prone

## Core Implementation

Unlike manual formatting, this method uses Flutter's localization generator to handle `DateTime` objects directly in the translation keys

### Example ARB Pattern:

```json
"dateFormat": "Date: {date}",
"@dateFormat": {
  "placeholders": {
    "date": {
      "type": "DateTime",
      "format": "yMd"
    }
  }
}
```
