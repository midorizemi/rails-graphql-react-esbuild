/* tslint:disable */
/* This is generated by ts_routes-rails */

export type ScalarType = string | number | boolean;

function $buildOptions(options: any, names: string[]): string {
  if (options) {
    let anchor = "";
    const q = [] as string[];
    for (const key of Object.keys(options)) {
      if (names.indexOf(key) !== -1) {
        // the key is already consumed
        continue;
      }

      const value = options[key];

      if (key === "anchor") {
        anchor = `#${$encode(value)}`;
      } else {
        $buildQuery(q, key, value);
      }
    }
    return (q.length > 0 ? "?" + q.join("&") : "") + anchor;
  } else {
    return "";
  }
}

function $buildQuery(q: string[], key: string, value: any) {
  if ($isScalarType(value)) {
    q.push(`${$encode(key)}=${$encode(value)}`);
  } else if (Array.isArray(value)) {
    for (const v of value) {
      $buildQuery(q, `${key}[]`, v);
    }
  } else if (value != null) {
    // i.e. non-null, non-scalar, non-array type
    for (const k of Object.keys(value)) {
      $buildQuery(q, `${key}[${k}]`, value[k]);
    }
  }
}

function $encode(value: any): string {
  return encodeURIComponent(value);
}

function $isScalarType(value: any): value is ScalarType {
  return (
    typeof value === "string" ||
    typeof value === "number" ||
    typeof value === "boolean"
  );
}

function $isPresent(value: any): boolean {
  return value != null && ("" + value).length > 0;
}

function $hasPresentOwnProperty(options: any, key: string): boolean {
  return options && options.hasOwnProperty(key) && $isPresent(options[key]);
}

/** /dashboard(.:format) */
export function dashboardPath(options?: object): string {
  return "/" + "dashboard" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/sign_in(.:format) */
export function newUserSessionPath(options?: object): string {
  return "/" + "users" + "/" + "sign_in" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/sign_in(.:format) */
export function userSessionPath(options?: object): string {
  return "/" + "users" + "/" + "sign_in" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/sign_out(.:format) */
export function destroyUserSessionPath(options?: object): string {
  return "/" + "users" + "/" + "sign_out" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/password/new(.:format) */
export function newUserPasswordPath(options?: object): string {
  return "/" + "users" + "/" + "password" + "/" + "new" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/password/edit(.:format) */
export function editUserPasswordPath(options?: object): string {
  return "/" + "users" + "/" + "password" + "/" + "edit" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/password(.:format) */
export function userPasswordPath(options?: object): string {
  return "/" + "users" + "/" + "password" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/cancel(.:format) */
export function cancelUserRegistrationPath(options?: object): string {
  return "/" + "users" + "/" + "cancel" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/sign_up(.:format) */
export function newUserRegistrationPath(options?: object): string {
  return "/" + "users" + "/" + "sign_up" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users/edit(.:format) */
export function editUserRegistrationPath(options?: object): string {
  return "/" + "users" + "/" + "edit" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /users(.:format) */
export function userRegistrationPath(options?: object): string {
  return "/" + "users" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** /home/index(.:format) */
export function homeIndexPath(options?: object): string {
  return "/" + "home" + "/" + "index" + ($hasPresentOwnProperty(options, "format") ? "." + (options as any).format : "") + $buildOptions(options, ["format"]);
}

/** / */
export function rootPath(options?: object): string {
  return "/" + $buildOptions(options, []);
}
