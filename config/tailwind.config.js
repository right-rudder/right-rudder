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
        //mobile
        wiggle: {
          '0%': { transform: 'translateX(-10rem) translateY(8rem) scale(.6)', opacity: '0' },
          '10%': { transform: 'rotate(0deg) translateY(0rem) scale(1)', opacity: '1'},
          '25%': { transform: 'rotate(7deg)'},
          '40%': { transform: 'rotate(5deg)'},
          '55%': { transform: 'rotate(7deg)'},
          '70%': { transform: 'rotate(0deg) translateY(0rem)', opacity: '1'},
          '100%': { transform: 'rotate(-30deg) translateX(25rem) translateY(-8rem) scale(.5)', opacity: '0'  },
        },
        //desktop
        wiggle2: {
          '0%': { transform: 'translateX(-10rem) translateY(8rem) scale(.6)', opacity: '0' },
          '10%': { transform: 'rotate(0deg) translateY(0rem) scale(1)', opacity: '1'},
          '25%': { transform: 'rotate(7deg)'},
          '40%': { transform: 'rotate(5deg)'},
          '55%': { transform: 'rotate(7deg)'},
          '70%': { transform: 'rotate(0deg) translateY(0rem)', opacity: '1'},
          '100%': { transform: 'rotate(-20deg) translateX(40rem) translateY(-3rem) scale(.7)', opacity: '0'  },
        },
      },
      backgroundImage : {
        'head' : "url('cessnamountain.webp')",
        //'head' : "url('cessnalake.webp')",
        'headsys' : "url('cockpitblue2.webp')",
        'headsys2' : "url('dave.webp')",
        'featured-notam' : "url('computer.webp')",
        'videothumb' : "url('youtubethumbrrmintro.webp')",
      },
      height: theme => ({
        'screen-1/2': '50vh',
        'screen-2/3': '75vh',
        'screen-1/3': 'calc(100vh / 3)',
      }),
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
  ]
}
