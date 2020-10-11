require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap/dist/js/bootstrap'

import '../styles/application'

import '../scripts/ask-button'

const images = require.context('../images', true)
