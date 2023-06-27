/** @type {import('tailwindcss').Config} */

export default {
  content: [
    "./index.html",
    "./src/**/*.{js,jsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var']
      },
      colors: {
        'dark-blue': "#002060ff",
        'bright-yellow': " #ffc100ff",
      }
    },
  },
  plugins: [
    // import('@tailwindcss/forms')
  ],
}
