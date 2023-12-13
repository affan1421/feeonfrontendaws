# FOLLOWED STEPS DURING SETUP.
1. npm create vite@latest
2. React + Typescript
3. npm i axios
4. npm i zustand 
5. setup api store

# TESTING SETUP
1. npm install -D vitest

2. npm install -D jsdom @testing-library/react @testing-library/jest-dom @testing-library/user-event

3. Add this to vite.config.ts
```javascript
<reference types="vitest" />
<reference types="vite/client" />
```

4. Import defineConfig from vitest instead of vite
```javascript
import { defineConfig } from 'vitest/config'
```

5. Add Config in vite.config.ts
```javascript
export default defineConfig({
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: './src/setup.ts',
    css: true
  },
  plugins: [react()],
})
```

6. File ./src/setup.ts from fivth step, Add import in setup file 
```javascript
import '@testing-library/jest-dom'
```

7. Add `"jsx":"react-jsx"` in tsconfig under compilerOptions 
8. Add `"types": ["vitest/globals"]` in tsconfig compilerOptions
9. Writing First Test
```javascript
import { render } from "@testing-library/react"
import { describe } from "vitest"
import App from "./App"
describe('Test Cases', () => {
    it('First Test', async () => {
        render(<App />)
    })
})
```

10. Setup Commands in package.json 
`"test": "vitest",
"testui": "vitest --ui"
`

# MOCK API SETUP FOR TESTING  

1. npm install msw --save-dev

2. Create Folder called handlers under src and create handlers.ts
```javascript
import { rest } from 'msw'
export const handlers = [
    rest.get('https://apiyouwillhitfromapplication/posts', (req, res, ctx) => {
        return res(
            ctx.status(200),
            ctx.json([mock data you want])
        )
    }),
]
```

3. Create mocks folder under src and setup.ts file
```javascript
import { setupServer } from 'msw/node'
import { handlers } from '../handlers/handlers'
// Here we import the handler created!
export const server = setupServer(...handlers)
```

4. Under src>setup.ts add this
```javascript
import { server } from '../src/mocks/setup'
beforeAll(() => server.listen({ onUnhandledRequest: 'error' }))
afterAll(() => server.close())
afterEach(() => server.resetHandlers())
```

5. Then you can call any api and dont forget to add that api in handlers before testings

# Release Notes #
```
Release v2.0.0 
Date : 13-06-2023
```
1. Custom Range Filters in Income/Expense Stats

2. User can select specific date or range (start and end date) to view stats

3. Bug fixes
    - Fixed bug in Application form
    - Fixed date filter bug in Income transaction table

4. Parent name in Income Transaction
    - Parent name column added in Income Transaction Table

5. Search Filter in Application List
    - Search Filter implemented in application list

6. Date Filter in Income Dashboard
    - User can filter Transactions by date

7. Date Filter in Expense Dashboard
    - User can filter Transactions by date

8. Receipts List in Student Collection
    - All receipts of individual student.
    - Receipts with status badges

9. Comment Box in Make Payment
    - Admin can now add comments in receipt

10. Receipt Cancellation 
    - ADMIN
        - Can view all receipts with filters
        - Can Raise a Cancellation Request for a particular receipt with comment.
        - Can Check and Constantly be Updated about the status of receipt
        - Comments for communication between management and admin
    - MANAGEMENT
        - Can view all receipts with status with filters
        - Can check requests of cancellations 
        - Can Approve and Reject with Comments
    - Filters in Receipt Cancellation
        - Search 
        - Class  
        - Date 
        - Status

11. Corresponding Receipt
    - Admin can select corresponding receipt during payment.

12. Donor Module
    - Dashboard
        - View all Donors
        - Stats (Total Amount Donated, Highest Donation, Top Donor)
        - Can view single donor, and list of students of that particular donor
        - Can Edit and Delete Donor
    - Can Select & Add Donor While Making Payment