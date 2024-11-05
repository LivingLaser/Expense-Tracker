function toggleAnswer(questionElement) {
    const answerElement = questionElement.nextElementSibling;
    answerElement.style.display = answerElement.style.display === "block" ? "none" : "block";
    questionElement.classList.toggle('open');
}