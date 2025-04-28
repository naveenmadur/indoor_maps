final geoJsonMap = {
  "type": "FeatureCollection",
  "features": [
    // Rooms (as you defined)
    {
      "type": "Feature",
      "properties": {"name": "Conference Room", "type": "room"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [10, 10],
            [50, 10],
            [50, 40],
            [10, 40],
            [10, 10]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "HR Cabin", "type": "room"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [55, 10],
            [85, 10],
            [85, 30],
            [55, 30],
            [55, 10]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Reception", "type": "area"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [10, 45],
            [40, 45],
            [40, 70],
            [10, 70],
            [10, 45]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Manager Cabin", "type": "room"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [45, 45],
            [75, 45],
            [75, 70],
            [45, 70],
            [45, 45]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Pantry", "type": "area"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [80, 45],
            [110, 45],
            [110, 70],
            [80, 70],
            [80, 45]
          ]
        ]
      }
    },

    // Workspace Area Boundary
    {
      "type": "Feature",
      "properties": {"name": "Workspace Area", "type": "boundary"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [10, 75],
            [110, 75],
            [110, 200],
            [10, 200],
            [10, 75]
          ]
        ]
      }
    },

    // Aisle 1 (Horizontal)
    {
      "type": "Feature",
      "properties": {"name": "Aisle 1", "type": "aisle"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [12, 92],
            [108, 92],
            [108, 98],
            [12, 98],
            [12, 92]
          ]
        ]
      }
    },

    // Aisle 2 (Horizontal)
    {
      "type": "Feature",
      "properties": {"name": "Aisle 2", "type": "aisle"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [12, 112],
            [108, 112],
            [108, 118],
            [12, 118],
            [12, 112]
          ]
        ]
      }
    },

    // Aisle 3 (Vertical)
    {
      "type": "Feature",
      "properties": {"name": "Aisle 3", "type": "aisle"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [5, 80],
            [10, 80],
            [10, 130],
            [5, 130],
            [5, 80]
          ]
        ]
      }
    },

    // Individual Desks (Example Layout)
    {
      "type": "Feature",
      "properties": {"name": "Desk 1", "type": "desk", "occupied": true},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [15, 80],
            [30, 80],
            [30, 90],
            [15, 90],
            [15, 80]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 2", "type": "desk", "occupied": true},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [35, 80],
            [50, 80],
            [50, 90],
            [35, 90],
            [35, 80]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 3", "type": "desk", "occupied": true},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [55, 80],
            [70, 80],
            [70, 90],
            [55, 90],
            [55, 80]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 4", "type": "desk", "occupied": true},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [75, 80],
            [90, 80],
            [90, 90],
            [75, 90],
            [75, 80]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 5", "type": "desk", "occupied": true},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [15, 100],
            [30, 100],
            [30, 110],
            [15, 110],
            [15, 100]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 6", "type": "desk", "occupied": true},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [35, 100],
            [50, 100],
            [50, 110],
            [35, 110],
            [35, 100]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 7", "type": "desk", "occupied": true},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [55, 100],
            [70, 100],
            [70, 110],
            [55, 110],
            [55, 100]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 8", "type": "desk", "occupied": true},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [75, 100],
            [90, 100],
            [90, 110],
            [75, 110],
            [75, 100]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 9", "type": "desk"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [15, 120],
            [30, 120],
            [30, 130],
            [15, 130],
            [15, 120]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 10", "type": "desk"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [35, 120],
            [50, 120],
            [50, 130],
            [35, 130],
            [35, 120]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 11", "type": "desk"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [55, 120],
            [70, 120],
            [70, 130],
            [55, 130],
            [55, 120]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Desk 12", "type": "desk"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [75, 120],
            [90, 120],
            [90, 130],
            [75, 130],
            [75, 120]
          ]
        ]
      }
    },

    // More Furniture (Example)
    {
      "type": "Feature",
      "properties": {"name": "Printer Station", "type": "furniture"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [95, 150],
            [105, 150],
            [105, 160],
            [95, 160],
            [95, 150]
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "properties": {"name": "Water Cooler", "type": "appliance"},
      "geometry": {
        "type": "Point",
        "coordinates": [15, 150]
      }
    }
  ]
};
