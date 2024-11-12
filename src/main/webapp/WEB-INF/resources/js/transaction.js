const validDate = document.getElementById('validDate');

// Get today's date
const today = new Date();
const todayDate = today.toISOString().split("T")[0]; // Formatted as YYYY-MM-DD

// Calculate date 10 years ago
const past = new Date();
past.setFullYear(today.getFullYear() - 10);
const pastDate = past.toISOString().split("T")[0]; // Formatted as YYYY-MM-DD

// Set the max min date attributes
validDate.max = todayDate;
validDate.min = pastDate;