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
      }
    },
  },
  plugins: [
    // import('@tailwindcss/forms')
  ],
}
