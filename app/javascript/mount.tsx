import React from "react";
import ReactDOM from "react-dom/client";

type Components = Record<string, React.ElementType>;
/**
 * NOTE:  このコードは、data-react-component属性を含むすべての要素を見つけ、その名前に一致するコンポーネントをそれらの場所にページにマウントしようとします。
 * このコードはまた、data-props属性に含まれるpropsを解析し、それらもコンポーネントに渡します。
 *  */
const mount = (components: Components): void => {
  document.addEventListener("DOMContentLoaded", () => {
    const mountPoints = document.querySelectorAll("[data-react-component]");
    mountPoints.forEach((mountPoint: HTMLElement) => {
      const { dataset } = mountPoint;
      const componentName = dataset.reactComponent;
      if (componentName != null) {
        const Component = components[componentName];
        // eslint-disable-next-line @typescript-eslint/strict-boolean-expressions
        if (Component) {
          if (dataset.props !== undefined) {
            const props = JSON.parse(dataset.props);
            const root = ReactDOM.createRoot(mountPoint);
            root.render(<Component {...props} />);
          } else {
            console.warn(
              "WARNING: No props found for: ",
              dataset.reactComponent,
              components
            );
          }
        } else {
          console.warn(
            "WARNING: No component found for: ",
            dataset.reactComponent,
            components
          );
        }
      }
    });
  });
};

export default mount;
