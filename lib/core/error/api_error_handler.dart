class ApiErrorHandler {
  static String parseErrors(Map<String, dynamic> errorResponse) {
    if (errorResponse.containsKey('errors')) {
      final errors = errorResponse['errors'] as Map<String, dynamic>;
      return errors.entries
          .map((entry) => '${entry.key}: ${entry.value.join(", ")}')
          .join("\n");
    }
    return "An unknown error occurred.";
  }
}
