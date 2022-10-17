const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      keyframes: {
        wiggle: {
          '0%': { transform: 'translateX(-10rem) translateY(8rem) scale(.6)', opacity: '0' },
          '10%': { transform: 'rotate(0deg) translateY(0rem) scale(1)', opacity: '1'},
          '25%': { transform: 'rotate(7deg)'},
          '40%': { transform: 'rotate(5deg)'},
          '55%': { transform: 'rotate(7deg)'},
          '70%': { transform: 'rotate(0deg) translateY(0rem)', opacity: '1'},
          '100%': { transform: 'rotate(-30deg) translateX(75rem) scale(.5)', opacity: '0'  },
        },
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
