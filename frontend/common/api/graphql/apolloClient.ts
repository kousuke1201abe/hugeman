import { ApolloClient } from 'apollo-client';
import { ApolloLink, concat } from 'apollo-link';
import { InMemoryCache } from 'apollo-cache-inmemory';
import { HttpLink } from 'apollo-link-http';

const csrfTokenElement: HTMLInputElement | null = document.querySelector(
  'meta[name=csrf-token]'
);

const csrfToken: string | null = csrfTokenElement
  ? csrfTokenElement.getAttribute('content')
  : null;

const authMiddleware = new ApolloLink((operation, forward) => {
  operation.setContext({
    headers: {
      'X-CSRF-Token': csrfToken,
    },
  });
  return forward(operation);
});

const httpLink = new HttpLink({ uri: '/graphql' });

export const client = new ApolloClient({
  link: concat(authMiddleware, httpLink),
  cache: new InMemoryCache(),
});
