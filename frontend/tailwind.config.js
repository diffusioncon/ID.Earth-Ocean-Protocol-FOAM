/*
 ** TailwindCSS Configuration File
 **
 ** Docs: https://tailwindcss.com/docs/configuration
 ** Default: https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
 */
module.exports = {
  theme: {
    extend: {
      'max-h': {
        '90-screen': '90vh'
      },
      fontFamily: {
        special: ['termina']
      },
      colors: {
        primary: '#5351FD',
        secondary: '#2EE3FF',
        dark: '#0E0032'
      }
    }
  },
  variants: {},
  plugins: []
}
