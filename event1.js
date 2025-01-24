 // Example events to populate the event list
 const events = [
    {
        title: 'Pottery Workshop',
        date: '9 Sep',
        description: 'Master the art of pottery with expert guidance.',
        organizer: 'Morvica Kolhe',
        price: '₹799',
        time: '3 hours',
        location: 'ArtVilla Academy, Borivali',
        imageUrl: 'uploads/pottery1.jpg',
        category: 'pottery',
        language: 'english'
    },
    {
        title: 'Painting Workshop',
        date: '10 Sep',
        description: 'Unleash your inner artist with hands-on painting sessions.',
        organizer: 'Neha Bura',
        price: '₹499',
        time: '2 hours',
        location: 'Dorangos Hall, Bandra',
        imageUrl: 'uploads/paintings.jpg',
        category: 'painting',
        language: 'spanish'
    },
    {
        title: 'Embroidery Workshop',
        date: '20 Sep',
        description: 'Unleash your inner artist with hands-on painting sessions.',
        organizer: 'Janhavi Jadhav',
        price: '₹399',
        time: '4hours',
        location: 'Kutchi Craft Academy, Kandivali',
        imageUrl: 'uploads/embroidery.jpg',
        category: 'embroidery',
        language: 'english'
    }
];

document.addEventListener('DOMContentLoaded', function () {
    
    populateEventCards(events);

    fetchEvents();


    function showDetailsModal(index, events) {
        const event = events[index];  // Access the event based on index
        if (!event) return;  // If no event found, do nothing
    
        // Populate the details modal with event information
        document.getElementById('modalTitle').textContent = event.title;
        document.getElementById('modalLocation').textContent = event.location || 'TBD';
        document.getElementById('modalDate').textContent = event.date;
        document.getElementById('modalTime').textContent = event.event_time || 'TBD';
        document.getElementById('modalOrganizer').textContent = event.organizer || 'TBD';
        document.getElementById('modalFees').textContent = event.price;
    
        // Show the modal
        const modal = document.getElementById('detailsModal');
        modal.style.display = 'block';
    }
    

    //  // Attach event listeners to each details button
    //  const detailsButtons = document.querySelectorAll('.details-button');
    //  detailsButtons.forEach(button => {
    //      button.addEventListener('click', function () {
    //          const index = this.getAttribute('data-index');
    //          showDetailsModal(index);
    //      });
    //  });
 
    
     function populateEventCards(filteredEvents) {
        const eventList = document.getElementById('event-list');
        eventList.innerHTML = '';
    
        filteredEvents.forEach((event, index) => {
            const eventCard = document.createElement('div');
            eventCard.classList.add('col-md-4');
    
            eventCard.innerHTML = `
                <div class="event-card">
                    <img src="${event.imageUrl}" alt="${event.title}" >
                    <h3>${event.title}</h3>
                    <p>${event.description}</p>
                    <p class="event-date">${event.date} | ${event.price}</p>
                    <button class="btn btn-primary details-button" data-index="${index}">Details</button>
                </div>
            `;
    
            eventList.appendChild(eventCard);
        });

    
        // Attach event listeners to the details buttons for both static and fetched events
        const detailsButtons = document.querySelectorAll('.details-button');
        detailsButtons.forEach(button => {
            button.addEventListener('click', function () {
                const index = this.getAttribute('data-index');
                showDetailsModal(index, filteredEvents);  // Pass the filtered events array to the modal function
            });
        });
    
        if (filteredEvents.length === 0) {
            eventList.innerHTML = `<p class="text-center">No events found matching your search.</p>`;
        }
    }
    
    // Initial population of event cards
    populateEventCards(events);
    

    // Handle filters form submission
    document.getElementById('filtersForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    // Get filter values
    var dateFilter = document.getElementById('dateFilter').value;
    var languageFilter = document.getElementById('languageFilter').value;
    var categoryFilter = document.getElementById('categoryFilter').value;
    var priceFilter = document.getElementById('priceFilter').value;

    // Filter events array
    var filteredEvents = events.filter(function(event) {
        var dateMatch = true;
        var languageMatch = true;
        var categoryMatch = true;
        var priceMatch = true;

        // Check for date match
        if (dateFilter) {
            // Convert both dateFilter and event.date to the same format if needed
            var selectedDate = new Date(dateFilter).toDateString();
            var eventDate = new Date(event.date).toDateString();
            dateMatch = selectedDate === eventDate;
        }

        // Check for language match
        if (languageFilter) {
            languageMatch = event.language === languageFilter;
        }

        // Check for category match
        if (categoryFilter) {
            categoryMatch = event.category === categoryFilter;
        }

        // Check for price match
        if (priceFilter) {
            var eventPrice = parseInt(event.price.replace('₹', '')); // Remove ₹ and parse
            var maxPrice = parseInt(priceFilter);  // Maximum price set by the user
            priceMatch = eventPrice <= maxPrice;
        }

        // Return only those events that match all the filters
        return dateMatch && languageMatch && categoryMatch && priceMatch;
    });

    // Populate the filtered events
    populateEventCards(filteredEvents);
});


    // Handle search functionality
    document.getElementById('searchForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const query = document.getElementById('searchInput').value.toLowerCase();
        const filteredEvents = events.filter(event => 
            event.title.toLowerCase().includes(query) || 
            event.description.toLowerCase().includes(query)
        );
        
        populateEventCards(filteredEvents);
    });
    

});


// Function to close the modal
function closeModal(modalId) {
    document.getElementById(modalId).style.display = 'none';
}

// Function to show the registration modal
function showRegistrationModal() {
    const modal = document.getElementById('registrationModal');
    modal.style.display = 'block';
}

// Function to close the modals
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.style.display = 'none';
}

// Handle form submission for registration
function submitRegistration(event) {
    event.preventDefault();
    // Handle registration logic (e.g., send data to the server)
    alert('Registration form submitted!');
    closeModal('registrationModal');
}

// Smooth scroll to events
function scrollToEvents() {
    document.querySelector('.events').scrollIntoView({ behavior: 'smooth' });
}

// Open create event modal
function openCreateEventModal() {
    document.getElementById('createEventModal').style.display = 'block';
}

// Close modal
function closeModal(modalId) {
    document.getElementById(modalId).style.display = 'none';
}


document.getElementById('createEventForm').addEventListener('submit', function(event) {
    event.preventDefault();

    // Collect form data
    var formData = new FormData(this);

    // AJAX request to send form data to the PHP script
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'create_event.php', true);

    xhr.onload = function() {
        if (xhr.status === 200) {
            console.log('Event saved successfully:', xhr.responseText);

            // Optionally clear the form
            document.getElementById('createEventForm').reset();

            // Dynamically update the event list (display both hardcoded and fetched events)
            fetchEvents();  // Calls fetchEvents() to display all events
        } else {
            console.error('Error saving event');
        }
    };

    // Send form data
    xhr.send(formData);
});


;

function fetchEvents() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'fetch_events.php', true);  // Make sure this path is correct

    xhr.onload = function() {
        if (xhr.status === 200) {
            try {
                var fetchedEvents = JSON.parse(xhr.responseText);

                console.log('Fetched events from PHP:', fetchedEvents);  // Debugging: log fetched events

                if (Array.isArray(fetchedEvents) && fetchedEvents.length > 0) {
                    // Merge hardcoded events and fetched events
                    var allEvents = [...events, ...fetchedEvents];  // Combine both arrays

                    populateEventCards(allEvents);
                } else {
                    console.error('No events fetched from the database.');
                }
            } catch (error) {
                console.error('Error parsing JSON from fetch_events.php:', error);
            }
        } else {
            console.error('Failed to fetch events. Status:', xhr.statusText);
        }
    };

    xhr.onerror = function() {
        console.error('Network request failed.');
    };

    xhr.send();
}



function populateEventCards(filteredEvents) {
    const eventList = document.getElementById('event-list');
    eventList.innerHTML = '';  // Clear existing events

    filteredEvents.forEach((event, index) => {
        const eventCard = document.createElement('div');
        eventCard.classList.add('col-md-4');

        eventCard.innerHTML = `
            <div class="event-card">
                <img src="${event.imageUrl}" alt="${event.title}" >
                <h3>${event.title}</h3>
                <p>${event.description}</p>
                <p class="event-date">${event.date} | ${event.price}</p>
                <button class="btn btn-primary details-button" data-index="${index}">Details</button>
            </div>
        `;

        eventList.appendChild(eventCard);
    });

    function showDetailsModal(index, events) {
        const event = events[index];  // Access the event based on index
        if (!event) return;  // If no event found, do nothing
    
        // Populate the details modal with event information
        document.getElementById('modalTitle').textContent = event.title;
        document.getElementById('modalLocation').textContent = event.location || 'TBD';
        document.getElementById('modalDate').textContent = event.date;
        document.getElementById('modalTime').textContent = event.event_time || 'TBD';
        document.getElementById('modalOrganizer').textContent = event.organizer || 'TBD';
        document.getElementById('modalFees').textContent = event.price;
    
        // Show the modal
        const modal = document.getElementById('detailsModal');
        modal.style.display = 'block';
    }

    // Attach event listeners to the details buttons
    const detailsButtons = document.querySelectorAll('.details-button');
    detailsButtons.forEach(button => {
        button.addEventListener('click', function () {
            const index = this.getAttribute('data-index');
            showDetailsModal(index, filteredEvents);  // Pass filtered events
        });
    });

    if (filteredEvents.length === 0) {
        eventList.innerHTML = `<p class="text-center">No events found matching your search.</p>`;
    }
}


