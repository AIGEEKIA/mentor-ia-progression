import { useState } from "react";

interface StandardComponentProps {
  title: string;
  description?: string;
  testId?: string;
  id?: string;
}

export default function StandardComponent({
  title,
  description,
  testId = "standard-component",
  id = "standard-component",
}: StandardComponentProps) {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <div
      id={id}
      data-testid={testId}
      role="region"
      aria-labelledby={`${id}-title`}
      className="p-6 bg-white rounded-lg shadow-md border border-gray-200"
    >
      <h2
        id={`${id}-title`}
        data-testid={`${testId}-title`}
        className="text-2xl font-bold text-gray-900 mb-4"
      >
        {title}
      </h2>

      {description && (
        <p
          id={`${id}-description`}
          data-testid={`${testId}-description`}
          className="text-gray-600 mb-6"
        >
          {description}
        </p>
      )}

      <button
        id={`${id}-action-button`}
        data-testid={`${testId}-action-button`}
        aria-label="Ouvrir les options du composant"
        aria-expanded={isOpen}
        aria-controls={`${id}-menu`}
        role="button"
        onClick={() => setIsOpen(!isOpen)}
        className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-colors"
      >
        {isOpen ? "Fermer" : "Ouvrir"} les options
      </button>

      {isOpen && (
        <div
          id={`${id}-menu`}
          data-testid={`${testId}-menu`}
          role="menu"
          aria-labelledby={`${id}-action-button`}
          className="mt-4 p-4 bg-gray-50 rounded-md border border-gray-200"
        >
          <h3
            id={`${id}-menu-title`}
            data-testid={`${testId}-menu-title`}
            className="text-lg font-semibold text-gray-900 mb-3"
          >
            Options disponibles
          </h3>

          <ul className="space-y-2">
            <li>
              <a
                role="menuitem"
                href="/option-1"
                data-testid={`${testId}-menu-item-1`}
                className="block px-3 py-2 text-blue-600 hover:bg-blue-50 rounded-md transition-colors"
              >
                Option 1
              </a>
            </li>
            <li>
              <a
                role="menuitem"
                href="/option-2"
                data-testid={`${testId}-menu-item-2`}
                className="block px-3 py-2 text-blue-600 hover:bg-blue-50 rounded-md transition-colors"
              >
                Option 2
              </a>
            </li>
            <li>
              <a
                role="menuitem"
                href="/option-3"
                data-testid={`${testId}-menu-item-3`}
                className="block px-3 py-2 text-blue-600 hover:bg-blue-50 rounded-md transition-colors"
              >
                Option 3
              </a>
            </li>
          </ul>
        </div>
      )}
    </div>
  );
}

// Test example
export function StandardComponentTest() {
  return (
    <div className="max-w-md mx-auto mt-8">
      <StandardComponent
        title="Composant Standard"
        description="Ce composant respecte tous nos standards de qualité : accessibilité, performance, SEO et tests."
        testId="example-standard-component"
        id="example-standard-component"
      />
    </div>
  );
}
