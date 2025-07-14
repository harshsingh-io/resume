function downloadPDF() {
    // This would typically link to your actual PDF file
    // For now, it will show an alert. Replace with your actual PDF URL
    const pdfUrl = 'https://github.com/harshsingh-io/resume/raw/main/Harsh_Singh_Software_Engineer_Resume.pdf';
    
    // Create a temporary link element and trigger download
    const link = document.createElement('a');
    link.href = pdfUrl;
    link.download = 'Harsh_Singh_Software_Engineer_Resume.pdf';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

// Add some interactive elements
document.addEventListener('DOMContentLoaded', function() {
    // Add smooth scroll for internal links
    const links = document.querySelectorAll('a[href^="#"]');
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });

    // Add loading animation
    const container = document.querySelector('.container');
    container.style.opacity = '0';
    container.style.transform = 'translateY(20px)';
    
    setTimeout(() => {
        container.style.transition = 'all 0.6s ease';
        container.style.opacity = '1';
        container.style.transform = 'translateY(0)';
    }, 100);
});